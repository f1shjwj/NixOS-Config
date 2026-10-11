# CyberGroupmate 容器栈 NixOS 模块
# root 模式 podman：开机自启，等待网络和 mihomo 就绪
# 镜像由 CyberGroupmate/update.sh 手动 podman build 管理（compose 只管运行，避免隐式 build 覆盖 tag）
{ pkgs, ... }:
{
  systemd.services.cybergroupmate-stack = {
    description = "CyberGroupmate podman stack (cybergroupmate)";
    after = [ "network-online.target" "mihomo.service" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    # podman-compose 脚本内部调用 podman，需加入服务 PATH（顶层属性，非 serviceConfig）
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      # 容器崩溃由 compose 的 restart: unless-stopped 自动重启
      ExecStart = "${pkgs.podman-compose}/bin/podman-compose -f /home/f1shjwj/Codespace/JustForFun/CyberGroupmate/compose.yaml up -d";
      ExecStop = "${pkgs.podman-compose}/bin/podman-compose -f /home/f1shjwj/Codespace/JustForFun/CyberGroupmate/compose.yaml down";
      TimeoutStartSec = 300;
      TimeoutStopSec = 120;
    };
  };
}
