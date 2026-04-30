{ username, pkgs, ... }:
{
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri.overrideAttrs (old: {
    patches = old.patches ++ [ ./tag_support-shm-sharing_4.patch ];
  });

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
