{ pkgs, ... }:
{
  imports = [
    ./bluetooth.nix
    ./kanshi.nix
    ./waybar
    ./eww
  ];

  home.packages = with pkgs; [
    udiskie
    mako
    waybar
    wlogout
    networkmanagerapplet
    wofi
    xdg-user-dirs
    wl-clipboard
    cliphist
    pavucontrol
    ddcutil
    power-profiles-daemon
    xdg-desktop-portal-hyprland
    # slurp    # 区域选择器
    # gnome.zenity # 图形弹窗
  ];

  services.mpris-proxy.enable = true;
}
