{ username, pkgs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    pavucontrol
    brightnessctl
    ddcutil
    playerctl

    wl-clipboard

    networkmanagerapplet
  ];

  home-manager.users.${username} = {
    programs = {
      wlogout.enable = true;
      rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
      };
    };

    services = {
      cliphist.enable = true;
      swaync.enable = true;
      udiskie.enable = true;
      network-manager-applet.enable = true;
      blueman-applet.enable = true;
      mpris-proxy.enable = true;
    };
  };
}
