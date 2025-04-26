{ pkgs, ... }:
{
  programs = {
    bash = {
      enable = true;
      initExtra = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]; then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
    fish = {
      enable = true;
    };
    alacritty = {
      enable = true;
      settings = {
        colors = {
          primary = {
            background = "#15141b";
            foreground = "#edecee";
          };
          cursor = {
            cursor = "#00D1FF";
          };
          selection = {
            text = "CellForeground";
            background = "#29263c";
          };
          normal = {
            black = "#110f18";
            red = "#ff6767";
            green = "#61ffca";
            yellow = "#ffca85";
            blue = "#a277ff";
            magenta = "#a277ff";
            cyan = "#61ffca";
            white = "#edecee";
          };
          bright = {
            black = "#4d4d4d";
            red = "#ff6767";
            green = "#61ffca";
            yellow = "#ffca85";
            blue = "#a277ff";
            magenta = "#a277ff";
            cyan = "#61ffca";
            white = "#edecee";
          };
          search = {
            matches = {
              foreground = "#000000";
              background = "#ffffff";
            };
            focused_match = {
              foreground = "#ffffff";
              background = "#00D1FF";
            };
          };
        };
        font = {
          normal = {
            family = "Hack Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "Hack Nerd Font";
            style = "Regular";
          };
          italic = {
            family = "Hack Nerd Font";
            style = "Italic";
          };
          bold_italic = {
            family = "Hack Nerd Font";
            style = "Italic";
          };
          size = 14.0;
          offset = {
            x = 0;
            y = 1;
          };
          glyph_offset = {
            x = 0;
            y = 1;
          };
        };
        window = {
          padding = {
            x = 22;
            y = 22;
          };
          decorations = "transparent";
          dimensions = {
            columns = 80;
            lines = 25;
          };
        };
        scrolling = {
          history = 100000;
          multiplier = 4;
        };
        cursor = {
          style = {
            shape = "Beam";
          };
        };
        # draw_bold_text_with_bright_colors = false;
        selection = {
          # semantic_escape_chars: ',│`|:"'' ()[]{}<>'
          save_to_clipboard = true;
        };
        # live_config_reload = true;
        # key_bindings
      };
    };
    # zellij = {
    #   enable = true;
    #   enableFishIntegration = true;
    # };
  };
}
