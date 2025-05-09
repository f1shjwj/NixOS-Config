{ username, pkgs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    wlogout
    networkmanagerapplet
    rofi-wayland
    xdg-user-dirs
    wl-clipboard
    cliphist
    pavucontrol
    brightnessctl
    playerctl
    ddcutil
    xdg-desktop-portal-hyprland
  ];

  home-manager.users.${username}.services = {
    swaync = {
      enable = true;
    };
    udiskie.enable = true;
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    mpris-proxy.enable = true;
  };
}
