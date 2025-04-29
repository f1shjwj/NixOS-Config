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
  ];

  services.mpris-proxy.enable = true;
}
