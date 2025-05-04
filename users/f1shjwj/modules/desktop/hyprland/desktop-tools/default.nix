{ pkgs, ... }:
{
  imports = [
    ./bluetooth.nix
    ./kanshi.nix
    ./waybar
    ./eww
  ];

  home.packages = with pkgs; [
    wlogout
    networkmanagerapplet
    rofi-wayland
    xdg-user-dirs
    wl-clipboard
    cliphist
    pavucontrol
    ddcutil
    xdg-desktop-portal-hyprland
  ];

  services.swaync = {
    enable = true;
  };

  services.udiskie.enable = true;
  services.network-manager-applet.enable = true;

  services.mpris-proxy.enable = true;
}
