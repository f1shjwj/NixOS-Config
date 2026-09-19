{ username, pkgs, ... }:
{
  users.users.${username}.packages = [ pkgs.fastfetch ];
  home-manager.users.${username} = { config, ... }: {
    xdg.configFile."fastfetch/config.jsonc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS-Config/users/f1shjwj/modules/software/cli/fastfetch/config.jsonc";
    xdg.configFile."fastfetch/nix.png".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS-Config/users/f1shjwj/modules/software/cli/fastfetch/nix.png";
  };
}
