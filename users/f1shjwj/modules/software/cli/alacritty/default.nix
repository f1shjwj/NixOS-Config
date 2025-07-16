{ username, ... }:
{
  home-manager.users.${username} = {
    programs.alacritty.enable = true;
    programs.alacritty.settings = {
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
      selection = {
        save_to_clipboard = true;
      };
    };
  };
}
