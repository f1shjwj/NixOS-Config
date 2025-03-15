{ pkgs, ... }:
{
  home.packages = with pkgs; [
    udiskie
    mako
    waybar
    wlogout
    networkmanagerapplet
    wofi
    # SwayNotificationCenter
    xdg-user-dirs
    copyq
    wl-clipboard
    cliphist
    blueman
    ddcutil
    # clipman  # 剪贴板历史管理
    # slurp    # 区域选择器
    # gnome.zenity # 图形弹窗
  ];

  # services.kanshi = {
  #   enable = true;
  #   # systemdTarget = "xdg-desktop-portal-hyprland.target"; # ?
  #   settings = [
  #     {
  #       profile.name = "docked";
  #       profile.outputs = [
  #         {
  #           criteria = "HDMI-A-1";
  #           mode = "1920x1080@100Hz"; # HDMI-A-1 的显示模式
  #         }
  #         {
  #           criteria = "eDP-1";
  #           position = "1920,0"; # 将 eDP-1 放置在 HDMI-A-1 的右侧
  #           transform = "90"; # 将 eDP-1 旋转 90 度
  #         }
  #       ];
  #     }
  #     {
  #       profile.name = "undocked";
  #       profile.outputs = [
  #         {
  #           criteria = "eDP-1";
  #           position = "0,0"; # 恢复 eDP-1 的默认位置
  #           transform = "normal"; # 恢复 eDP-1 的默认旋转
  #         }
  #       ];
  #     }
  #   ];
  # };
}
