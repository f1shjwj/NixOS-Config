{ username, pkgs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    # 系统工具与监控
    pavucontrol
    brightnessctl
    ddcutil
    playerctl

    # 剪贴板
    wl-clipboard

    # 显示与锁屏
    swaybg
    gtklock

    # 网络
    networkmanagerapplet

    # XDG 相关
    xdg-user-dirs
  ];

  home-manager.users.${username} = {
    programs = {
      # 锁屏程序
      wlogout.enable = true;

      # 应用启动器
      rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
      };
    };

    services = {
      # 剪贴板服务
      cliphist.enable = true;

      # 通知与空闲管理
      swaync.enable = true;
      swayidle.enable = true;

      # 存储与挂载
      udiskie.enable = true;

      # 网络与蓝牙服务
      network-manager-applet.enable = true;
      blueman-applet.enable = true;

      # 媒体控制
      mpris-proxy.enable = true;
    };
  };
}
