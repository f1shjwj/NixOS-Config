{ pkgs, ... }:
{
  imports = [
    ./desktop-tools
    ./hypridle.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./pointer-cursor.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./conf/hyprland.conf;
  };

  home.packages = with pkgs; [
    hyprshot
    hyprcursor
    hyprpicker
    hyprpolkitagent
  ];

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
