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
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gtklock
    swaybg
  ];

  home-manager.users.${username}.services = {
    swaync = {
      enable = true;
    };
    swayidle = {
      enable = true;
    };
    udiskie.enable = true;
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    mpris-proxy.enable = true;
  };
}
