{ username, pkgs-unstable, ... }:
{
  home-manager.users.${username}.programs.wezterm = {
    enable = true;
    package = pkgs-unstable.wezterm;
    extraConfig = builtins.readFile ./wezterm.lua;
    colorSchemes.jwj-theme = {
      background = "#1e1e1e";
      foreground = "#d4d4d4";
      cursor_bg = "#00d1ff";
      # cursor_border = "#00d1ff";
      # cursor_fg = "#1e1e1e";
      selection_bg = "#3a3d41";
      # selection_fg = "#d4d4d4";
      ansi = [
        "#1e1e1e"
        "#f44747"
        "#4ec9b0"
        "#d7ba7d"
        "#4fc1ff"
        "#ff79c6"
        "#9cdcfe"
        "#d4d4d4"
      ];
      brights = [
        "#808080"
        "#f44747"
        "#4ec9b0"
        "#d7ba7d"
        "#4fc1ff"
        "#ff79c6"
        "#9cdcfe"
        "#ffffff"
      ];
    };
  };
}
