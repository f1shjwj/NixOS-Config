{ username, pkgs, ... }:
{
  programs.niri.enable = true;

  users.users.${username}.packages = with pkgs; [
    xwayland-satellite
  ];

  home-manager.users.${username} = {
    home.file.".config/niri" = {
      source = ./configs;
      recursive = true;
    };
  };
}
