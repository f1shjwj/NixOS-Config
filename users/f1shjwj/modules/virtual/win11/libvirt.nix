{
  username,
  pkgs,
  ...
}:
{
  # libvirtd 的 NAT 网络需要 bridge 内核模块
  boot.kernelModules = [ "bridge" ];

  # SPICE 剪贴板桥接：guest 的 spice-vdagent 数据经此 daemon 写入 Wayland 剪贴板
  environment.systemPackages = [ pkgs.spice-vdagent ];
  systemd.user.services.spice-vdagentd = {
    description = "SPICE vdagent daemon (clipboard bridge)";
    wantedBy = [ "default.target" ];
    serviceConfig = {
      Type = "simple";
      RuntimeDirectory = "spice-vdagentd"; # 自动创建 %t/spice-vdagentd
      ExecStart = "${pkgs.spice-vdagent}/bin/spice-vdagentd -S %t/spice-vdagentd/spice-vdagent-sock -x -d";
      Restart = "on-failure";
    };
  };

  # 声明式 VM 定义：登录时幂等 define（同名覆盖），XML 源文件在 flake 内
  # 删除本服务 + XML 后，手动 `virsh undefine F1shjwj-Win11` 清理
  systemd.user.services.libvirt-define-win11 = {
    description = "Declarative define of F1shjwj-Win11 VM";
    wantedBy = [ "default.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.libvirt}/bin/virsh -c qemu:///session define ${./F1shjwj-Win11.xml}";
      RemainAfterExit = true;
      Restart = "on-failure";
      RestartSec = 5;
    };
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      # OVMF (UEFI) 固件：26.11 随 QEMU 默认分发，无需配置
      swtpm.enable = true; # TPM 2.0 模拟（libvirt 12.4 + QEMU 11 暂不兼容，待上游适配）
    };
  };

  users.users.${username} = {
    extraGroups = [ "libvirtd" ];
    packages = with pkgs; [
      virt-manager # GUI 管理
      virt-viewer # SPICE 显示客户端
      virtio-win # Windows virtio 驱动 ISO
      # win11 命令族：server（VM 生命周期）+ view（SPICE 显示）
      # 独立脚本 ./win11.sh + writeShellApplication（runtimeInputs 注入依赖 PATH）
      (pkgs.writeShellApplication {
        name = "win11";
        runtimeInputs = [ pkgs.virt-viewer pkgs.libvirt pkgs.util-linux ];
        text = builtins.readFile ./win11.sh;
      })
    ];
  };
}
