{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  services = {
    hypridle = {
      enable = true;
    };
    hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "${./portal.png}"
        ];
        wallpaper = [
          ", ${./portal.png}"
        ];
      };
    };
  };

  programs.hyprlock = {
    enable = true;
  };

  home.packages = with pkgs; [
    hyprshot
    hyprpolkitagent
  ];

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
