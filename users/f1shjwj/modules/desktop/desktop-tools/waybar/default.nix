{ username, ... }:
{
  home-manager.users.${username} = {
    programs.waybar = {
      enable = true;
      style = ./style.css;
      systemd.enable = true;
    };

    programs.waybar.settings.mainBar = {
      height = 30;
      spacing = 4;
      modules-left = [
        "niri/workspaces"
        "wlr/taskbar"
        "niri/window"
      ];
      modules-center = [ ];
      modules-right = [
        # "mpd"
        # "idle_inhibitor"
        # "cpu"
        # "memory"
        # "temperature"
        "network"
        "pulseaudio"
        "backlight"
        "battery"
        "power-profiles-daemon"
        "tray"
        "clock"
        "custom/notification"
      ];
      "niri/workspaces" = {
        on-scroll-up = "niri msg action focus-workspace-up";
        on-scroll-down = "niri msg action focus-workspace-down";
        on-click = "activate";
        active-only = false;
        all-outputs = true;
      };
      "wlr/taskbar" = {
        format = "{icon}";
        icon-size = 18;
        tooltip-format = "{title}";
        on-click = "activate";
        on-click-middle = "close";
        ignore-list = [
          "Alacritty"
          "kitty"
        ];
        app_ids-mapping = {
          firefoxdeveloperedition = "firefox-developer-edition";
        };
        rewrite = {
          "Firefox Web Browser" = "Firefox";
        };
      };
      "niri/window" = {
        max-length = 60;
        rewrite = {
          "(.*) - Visual Studio Code" = "$1";
        };
        separate-outputs = true;
      };
      tray = {
        # icon-size = 21;
        spacing = 10;
      };
      clock = {
        # timezone = "America/New_York";
        format = "{:%Y-%m-%d <span weight='bold'>%H:%M</span>}";
        tooltip-format = "<big>{:%Y-%m-%d}</big>\n<tt><small>{calendar}</small></tt>";
      };
      backlight = {
        # device = "acpi_video1";
        format = "{percent}% {icon}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
        ];
      };
      battery = {
        states = {
          # good = 95;
          warning = 50;
          critical = 20;
        };
        format = "{capacity}% {icon}";
        format-full = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        # format-good = "";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
      };
      power-profiles-daemon = {
        format = "{icon}";
        tooltip-format = "Power profile: {profile}\nDriver: {driver}";
        tooltip = true;
        format-icons = {
          default = "";
          performance = "";
          balanced = "";
          power-saver = "";
        };
      };
      network = {
        # interface = "wlp2*";
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ipaddr}/{cidr} ";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
      pulseaudio = {
        # scroll-step = 1;
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [
            ""
            ""
            ""
          ];
        };
        on-click = "pavucontrol";
      };
      "custom/notification" = {
        format = " ";
        tooltip = false;
        exec = "swaync-client -sw";
        on-click = "swaync-client -t";
      };
    };
  };
}
