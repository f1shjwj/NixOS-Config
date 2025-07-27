{ username, ... }:
{
  home-manager.users.${username} = {
    programs.alacritty.enable = true;
    programs.alacritty.settings = {
      font = {
        size = 14;
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
      };
      window = {
        # opacity = 0.9;
        padding = {
          x = 22;
          y = 22;
        };
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
      colors = {
        primary = {
          background = "#1e1e1e";
          foreground = "#d4d4d4";
        };
        selection = {
          text = "CellForeground";
          background = "#3a3d41";
        };
        cursor = {
          cursor = "#00d1ff";
        };
        normal = {
          black = "#1e1e1e";
          red = "#f44747";
          green = "#4ec9b0";
          yellow = "#d7ba7d";
          blue = "#4fc1ff";
          magenta = "#ff79c6";
          cyan = "#9cdcfe";
          white = "#d4d4d4";
        };
        bright = {
          black = "#808080";
          red = "#f44747";
          green = "#4ec9b0";
          yellow = "#d7ba7d";
          blue = "#4fc1ff";
          magenta = "#ff79c6";
          cyan = "#9cdcfe";
          white = "#ffffff";
        };
        search = {
          matches = {
            foreground = "#000000";
            background = "#ffffff";
          };
          focused_match = {
            foreground = "#ffffff";
            background = "#00d1ff";
          };
        };
      };
    };
  };
}
