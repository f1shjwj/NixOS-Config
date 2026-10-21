{ pkgs, username, ... }:
{
  users.users.${username}.packages = [ pkgs.vicinae ];

  home-manager.users.${username} = { config, ... }: {
    home.file.".config/vicinae" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS-Config/users/f1shjwj/modules/desktop/desktop-tools/vicinae/configs";
    };
  };
}
