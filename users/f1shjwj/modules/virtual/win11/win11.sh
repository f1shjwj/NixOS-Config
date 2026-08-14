# F1shjwj-Win11 管理命令（声明式，flake 内）
# 依赖注入：writeShellApplication runtimeInputs = [ virt-viewer libvirt util-linux iproute2 ]（libvirt.nix）
# 用法: win11 [--debug] | win11 [--debug] server start|stop|restart|status|suspend|resume | win11 [--debug] view
set -euo pipefail
URI="qemu:///session"
DOM="F1shjwj-Win11"

# --debug/-d 或环境变量 WIN11_DEBUG=1：打印实际执行的命令（日志到 stderr）
DEBUG=0
if [ "${1:-}" = "--debug" ] || [ "${1:-}" = "-d" ]; then
  DEBUG=1
  shift
fi
[ -n "${WIN11_DEBUG:-}" ] && DEBUG=1

# 简单命令别名：win11 关机 == win11 server stop；中文/短命令/缩写重写为标准形式
case "${1:-}" in
  s)           set -- server "${2:-}" ;;
  v)           set -- view ;;
  stop|关机)      set -- server stop ;;
  start|开机|打开) set -- server start ;;
  restart|重启)   set -- server restart ;;
  status|状态)    set -- server status ;;
  suspend|挂起)   set -- server suspend ;;
  resume|恢复)    set -- server resume ;;
esac

run() {
  if [ "$DEBUG" = 1 ]; then
    echo "> $*" >&2
  fi
  "$@"
}

state() { virsh -c "$URI" domstate "$DOM" 2>/dev/null; }

# 打开显示窗口（后台 setsid 脱离终端；stderr 保留：debug 日志与 viewer 错误可见）
open_view() {
  run setsid remote-viewer --cursor=local --spice-disable-effects=all --auto-resize=never --spice-preferred-compression=lz4 spice://127.0.0.1:65000 &
  sleep 1
  if ! pgrep -f "remote-viewer.*65000" >/dev/null; then
    echo "错误: remote-viewer 启动失败（见上方输出）" >&2
    exit 1
  fi
  echo "已打开显示窗口"
}

# 等 SPICE 端口监听（start 后 qemu 需几秒才就绪），最多 15 秒
wait_spice() {
  for _ in $(seq 1 15); do
    ss -tln | grep -q ':65000' && return 0
    sleep 1
  done
  return 1
}

usage() {
  echo "用法:"
  echo "  win11 [--debug] [--help]                   一键模式：未开机则启动，然后打开显示"
  echo "  win11 [--debug] s|server stop|start|restart|status|suspend|resume   管理 VM 生命周期"
  echo "  win11 [--debug] v|view                     打开显示（VM 需已启动或挂起）"
  echo "  短命令/中文别名：stop|关机  start|开机|打开  restart|重启  status|状态  suspend|挂起  resume|恢复"
  echo "  --debug/-d 打印实际执行的命令；--help/-h 显示帮助（日志到 stderr）"
}

# --help/-h：帮助（usage 需先定义）
case "${1:-}" in
  --help|-h) usage; exit 0 ;;
esac

case "${1:-}" in
  "")
    # 一键模式：确保 VM 可看，然后打开显示
    case "$(state)" in
      running) : ;;
      paused)  run virsh -c "$URI" resume "$DOM"; echo "已从挂起恢复" ;;
      *)       run virsh -c "$URI" start "$DOM"; echo "已启动 F1shjwj-Win11" ;;
    esac
    wait_spice || { echo "错误: SPICE 端口 65000 未就绪" >&2; exit 1; }
    open_view
    ;;
  server)
    case "${2:-}" in
      start)
        case "$(state)" in
          running) echo "F1shjwj-Win11 已在运行" ;;
          paused)  echo "F1shjwj-Win11 已挂起，先恢复: win11 server resume" ;;
          *)       run virsh -c "$URI" start "$DOM"; echo "已启动，打开显示: win11 view" ;;
        esac
        ;;
      stop)
        case "$(state)" in
          "shut off") echo "F1shjwj-Win11 未运行" ;;
          paused)     echo "已挂起，先恢复再关机: win11 server resume" ;;
          *)          run virsh -c "$URI" shutdown "$DOM"; echo "已发送关机指令（ACPI 优雅关机，等待 Windows 关闭）" ;;
        esac
        ;;
      restart)
        case "$(state)" in
          running) run virsh -c "$URI" reboot "$DOM"; echo "已发送重启指令" ;;
          paused)  echo "已挂起，先恢复: win11 server resume" ;;
          *)       echo "未运行，先启动: win11 server start" ;;
        esac
        ;;
      status)
        run virsh -c "$URI" domstate "$DOM"
        ;;
      suspend)
        case "$(state)" in
          running) run virsh -c "$URI" suspend "$DOM"; echo "已挂起（恢复: win11 server resume）" ;;
          paused)  echo "已挂起" ;;
          *)       echo "未运行，无法挂起" ;;
        esac
        ;;
      resume)
        case "$(state)" in
          paused) run virsh -c "$URI" resume "$DOM"; echo "已恢复" ;;
          *)      echo "未处于挂起状态" ;;
        esac
        ;;
      *)
        usage
        ;;
    esac ;;
  view)
    case "$(state)" in
      running|paused) : ;;
      *) echo "错误: F1shjwj-Win11 未运行，先启动: win11 server start" >&2; exit 1 ;;
    esac
    open_view
    ;;
  *)
    usage
    ;;
esac
