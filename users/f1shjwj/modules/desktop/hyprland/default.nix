{ username, pkgs, ... }:
{
  programs.hyprland.enable = true;

  users.users.${username}.packages = with pkgs; [
    hyprshot
    hyprcursor
    hyprpicker
    hyprpolkitagent
  ];

  home-manager.users.${username} = {
    imports = [
      ./hypr/hypridle.nix
      ./hypr/hyprpaper.nix
      ./hypr/hyprlock.nix
      ./hypr/pointer-cursor.nix
    ];

    xresources.properties = {
      "Xcursor.size" = 24;
      "Xft.dpi" = 192;
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

    home.file.".config/hypr/configs/" = {
      source = ./configs;
      recursive = true;
    };
  };
}
