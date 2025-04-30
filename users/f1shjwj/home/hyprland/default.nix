{ pkgs, ... }:
{
  imports = [
    ./desktop-tools
    ./hypridle.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./pointer-cursor.nix
  ];

  xresources.properties = {
    "Xcursor.size" = 24;
    "Xft.dpi" = 192;
  };

  home.file.".config/hypr/configs/" = {
    source = ./configs;
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings.source = [
      "./configs/settings.conf"
      "./configs/keybinds.conf"
      "./configs/startup.conf"
      "./configs/variables.conf"
      "./configs/window_rules.conf"
      "./configs/animations.conf"
    ];
  };

  home.packages = with pkgs; [
    hyprshot
    hyprcursor
    hyprpicker
    hyprpolkitagent
  ];

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
