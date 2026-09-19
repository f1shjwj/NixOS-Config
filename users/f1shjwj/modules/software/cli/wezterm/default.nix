{ username, ... }:
{
  home-manager.users.${username} = { config, ... }: {
    home.sessionVariables.WEZTERM_CONFIG_FILE = "/home/${username}/.config/wezterm/wezterm.lua";
    programs.wezterm.enable = true;
    xdg.configFile."wezterm/wezterm.lua".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS-Config/users/f1shjwj/modules/software/cli/wezterm/wezterm.lua";
  };
}
