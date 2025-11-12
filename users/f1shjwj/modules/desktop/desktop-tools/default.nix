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
    services = {
      cliphist.enable = true;
      udiskie.enable = true;
      network-manager-applet.enable = true;
      blueman-applet.enable = true;
      mpris-proxy.enable = true;
    };
  };
}
