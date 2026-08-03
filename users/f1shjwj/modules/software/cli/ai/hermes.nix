# Hermes 容器栈 NixOS 模块
# root 模式 podman：开机自启，等待网络和 mihomo 就绪
{ pkgs, ... }:
{
  systemd.services.hermes-stack = {
    description = "Hermes podman stack (hermes gateway + searxng)";
    after = [ "network-online.target" "mihomo.service" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    # podman-compose 脚本内部调用 podman，需加入服务 PATH（顶层属性，非 serviceConfig）
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      # 容器崩溃由 compose 的 restart: unless-stopped 自动重启；
      # gateway 内部还有重连观察器 + s6 监督，网络短暂不可用可自愈
      ExecStart = "${pkgs.podman-compose}/bin/podman-compose -f /home/f1shjwj/Codespace/hermes/compose.yaml up -d";
      ExecStop = "${pkgs.podman-compose}/bin/podman-compose -f /home/f1shjwj/Codespace/hermes/compose.yaml down";
      TimeoutStartSec = 300;
      TimeoutStopSec = 120;
    };
  };
}
