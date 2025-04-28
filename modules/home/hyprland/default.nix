{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          # on_lock_cmd = "loginctl lock-session";
        };
        listener = [
          {
            timeout = 600;
            on-timeout = "pidof hyprlock || hyprlock";
          }
          {
            timeout = 1800;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
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
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        ignore_empty_input = true;
      };
      background = [
        {
          monitor = "";
          path = "${./portal.png}";
        }
      ];
      input-field = [
        {
          monitor = "";
          shadow_passes = 1;
          hide_input = true;
          placeholder_text = "";
          fail_text = "";
        }
      ];
      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo $(date)";
        }
      ];
    };
  };

  home.packages = with pkgs; [
    hyprshot
    hyprcursor
    hyprpicker
    hyprpolkitagent
  ];

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
