set -euo pipefail

URL="https://live.bilibili.com/27519423"
SESSION="lofigirl"
SOCK="${XDG_RUNTIME_DIR:-/tmp}/lofi.sock"
STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/lofi"
VOL_FILE="$STATE_DIR/volume"
MUTE_FILE="$STATE_DIR/mute"

usage() {
  cat <<'EOF'
lofi - lofigirl 直播独立播放器（B站 27519423，纯音频）

用法: lofi [命令]
  (无参)    toggle：未播放→启动；播放中→暂停(停流)；暂停→播放(重连)
  start     启动（tmux 后台 + mpv IPC socket）
  stop      暂停/停止（杀 mpv，零后台加载）
  status    显示播放状态与音量
  vol [N|+N|-N]  独立音量 0-130（持久化，不影响其他 mpv）
  mute      静音切换（持久化）
  -h        帮助
EOF
}

state_dir_init() {
  mkdir -p "$STATE_DIR"
  [[ -f "$VOL_FILE" ]] || echo 100 > "$VOL_FILE"
  [[ -f "$MUTE_FILE" ]] || echo no > "$MUTE_FILE"
}

# mpv 活着 = tmux session 在 且 IPC socket 在
is_running() {
  tmux has-session -t "$SESSION" 2>/dev/null && [[ -S "$SOCK" ]]
}

cmd_start() {
  state_dir_init
  if is_running; then
    echo "已在播放"
    cmd_status
    return 0
  fi
  # 清残留 session（mpv 可能已退出但 session 还在）
  tmux kill-session -t "$SESSION" 2>/dev/null || true
  local vol mute
  vol=$(cat "$VOL_FILE")
  mute=$(cat "$MUTE_FILE")
  tmux new -d -s "$SESSION" \
    "mpv --no-video --volume=$vol --mute=$mute --input-ipc-server=$SOCK --title=lofigirl '$URL'"
  # 等 socket 就绪（最多 10s）
  for _ in $(seq 1 20); do
    [[ -S "$SOCK" ]] && break
    sleep 0.5
  done
  if is_running; then
    echo "▶ 已启动 · 音量 $vol"
  else
    echo "⚠ mpv 未就绪，看 tmux attach -t $SESSION 日志"
    return 1
  fi
}

cmd_stop() {
  if ! is_running && ! tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "未在播放"
    return 0
  fi
  tmux kill-session -t "$SESSION" 2>/dev/null || true
  rm -f "$SOCK"
  echo "⏸ 已暂停（流已停，零后台加载）"
}

cmd_toggle() {
  if is_running; then
    cmd_stop
  else
    cmd_start
  fi
}

cmd_status() {
  state_dir_init
  local vol mute
  vol=$(cat "$VOL_FILE")
  mute=$(cat "$MUTE_FILE")
  if is_running; then
    if [[ "$mute" == "yes" ]]; then
      echo "▶ 播放中（已静音）· 音量 $vol"
    else
      echo "▶ 播放中 · 音量 $vol"
    fi
  else
    echo "未播放 · 音量 $vol（lofi 启动）"
  fi
}

cmd_vol() {
  state_dir_init
  local arg="${1:-}" newvol
  if [[ -z "$arg" ]]; then
    echo "用法: lofi vol [N|+N|-N]（0-130）"
    return 1
  fi
  if [[ "$arg" =~ ^\+[0-9]+$ ]]; then
    newvol=$(( $(cat "$VOL_FILE") + ${arg#+} ))
  elif [[ "$arg" =~ ^-[0-9]+$ ]]; then
    newvol=$(( $(cat "$VOL_FILE") - ${arg#-} ))
  elif [[ "$arg" =~ ^[0-9]+$ ]]; then
    newvol=$arg
  else
    echo "参数无效: $arg（0-130 整数，或 +N/-N）"
    return 1
  fi
  (( newvol < 0 )) && newvol=0
  (( newvol > 130 )) && newvol=130
  echo "$newvol" > "$VOL_FILE"
  if is_running; then
    echo "{\"command\":[\"set_property\",\"volume\",$newvol]}" \
      | socat - "UNIX-CONNECT:$SOCK" >/dev/null 2>&1 || true
  fi
  echo "音量: $newvol"
}

cmd_mute() {
  state_dir_init
  local mute
  mute=$(cat "$MUTE_FILE")
  if [[ "$mute" == "yes" ]]; then mute=no; else mute=yes; fi
  echo "$mute" > "$MUTE_FILE"
  if is_running; then
    echo '{"command":["cycle","mute"]}' \
      | socat - "UNIX-CONNECT:$SOCK" >/dev/null 2>&1 || true
  fi
  if [[ "$mute" == "yes" ]]; then echo "已静音"; else echo "已取消静音"; fi
}

cmd="${1:-toggle}"
case "$cmd" in
  "" | toggle) cmd_toggle ;;
  start) cmd_start ;;
  stop) cmd_stop ;;
  status) cmd_status ;;
  vol) cmd_vol "${2:-}" ;;
  mute) cmd_mute ;;
  -h | --help | help) usage ;;
  *) usage; exit 1 ;;
esac
