{ username, pkgs, ... }:
{
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri.overrideAttrs (old: {
    patches = old.patches ++ [ ./tag_support-shm-sharing_5.patch ];
  });

  users.users.${username}.packages = with pkgs; [
    xwayland-satellite
  ];

  home-manager.users.${username} = { config, ... }: {
    home.file.".config/niri" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS-Config/users/f1shjwj/modules/desktop/niri/configs";
    };
  };
}
