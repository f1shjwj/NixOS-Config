# F1shjwj-Win11 管理命令（声明式，flake 内）
# 依赖注入：writeShellApplication runtimeInputs = [ virt-viewer libvirt util-linux ]（libvirt.nix）
# 用法: win11 [--debug] server start|stop|restart|status|suspend|resume | win11 [--debug] view
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

run() {
  if [ "$DEBUG" = 1 ]; then
    echo "> $*" >&2
  fi
  "$@"
}

state() { virsh -c "$URI" domstate "$DOM" 2>/dev/null; }

usage() {
  echo "用法:"
  echo "  win11 [--debug] server start|stop|restart|status|suspend|resume   管理 VM 生命周期"
  echo "  win11 [--debug] view                                              打开显示（VM 需已启动或挂起）"
  echo "  --debug/-d 或 WIN11_DEBUG=1: 打印实际执行的命令（日志到 stderr）"
}

case "${1:-}" in
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
    # 后台打开显示（setsid 脱离终端，关终端不关窗口）
    # stderr 不重定向：debug 日志可见 + viewer 错误可见
    run setsid remote-viewer --cursor=local --spice-disable-effects=all --auto-resize=never --spice-preferred-compression=lz4 spice://127.0.0.1:65000 &
    sleep 1
    if ! pgrep -f "remote-viewer.*65000" >/dev/null; then
      echo "错误: remote-viewer 启动失败（见上方输出）" >&2
      exit 1
    fi
    echo "已打开显示窗口"
    ;;
  *)
    usage
    ;;
esac
