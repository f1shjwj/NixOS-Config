{ username, ... }:
{
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
    terminal-exec = {
      enable = true;
      settings = {
        default = [ "org.wezfurlong.wezterm.desktop" ];
      };
    };
  };

  home-manager.users.${username} = { config, ... }: {
    xdg = {
      userDirs = {
        enable = true;
        setSessionVariables = true;
      };
      autostart.enable = true;
    };
    xdg.configFile."mimeapps.list".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS-Config/users/f1shjwj/modules/desktop/core/mimeapps.list";
  };
}
