{ username, pkgs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    networkmanagerapplet
    xdg-user-dirs
    wl-clipboard
    pavucontrol
    brightnessctl
    ddcutil
    playerctl
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gtklock
    swaybg
  ];

  home-manager.users.${username} = {
    programs.wlogout.enable = true;
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };

    services.cliphist.enable = true;
    services.swaync.enable = true;
    services.swayidle.enable = true;
    services.udiskie.enable = true;
    services.network-manager-applet.enable = true;
    services.blueman-applet.enable = true;
    services.mpris-proxy.enable = true;
  };
}
