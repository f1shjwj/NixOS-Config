{ username, ... }:
{
  home-manager.users.${username} = {
    programs.waybar = {
      enable = true;
      style = ./style.css;
      systemd.enable = true;
    };

    programs.waybar.settings.mainBar = {
      height = 36;
      spacing = 0;
      modules-left = [
        "niri/workspaces"
        "wlr/taskbar"
        "niri/window"
      ];
      modules-center = [ ];
      modules-right = [
        "network"
        "pulseaudio"
        "backlight"
        "battery"
        "power-profiles-daemon"
        "custom/notification"
        "tray"
        "clock"
      ];
      "niri/workspaces" = {
        on-scroll-up = "niri msg action focus-workspace-up";
        on-scroll-down = "niri msg action focus-workspace-down";
        on-click = "activate";
      };
      "niri/window" = {
        max-length = 60;
        separate-outputs = true;
      };
      "wlr/taskbar" = {
        icon-size = 18;
        on-click = "activate";
        on-click-middle = "close";
      };
      tray = {
        icon-size = 16;
        spacing = 10;
        reverse-direction = true;
      };
      clock = {
        locale = "en_US.UTF-8";
        format = "{:%Y-%m-%d <span weight='bold'>%H:%M</span>}";
        tooltip-format = "<tt><span size='12pt'>{calendar}</span></tt>";
        calendar = {
          weeks-pos = "right";
          mode-mon-col = 4;
          on-scroll = -1;
          format = {
            months = "<span color='#d4d4d4'>{}</span>";
            days = "<span color='#d4d4d4'>{}</span>";
            weeks = "<span color='#4ec9b0'>W{}</span>";
            weekdays = "<span color='#d7ba7d'><b>{}</b></span>";
            today = "<span color='#9cdcfe'><b><u>{}</u></b></span>";
          };
        };
        actions = {
          on-click = "shift_reset";
          on-click-right = "mode";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
      };
      backlight = {
        format = "{icon}";
        tooltip-format = "{percent}% {icon}";
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
          warning = 50;
          critical = 20;
        };
        format = "{icon}";
        format-charging = "";
        format-plugged = "";
        tooltip-format = "{capacity}% - {timeTo}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
      };
      power-profiles-daemon = {
        format-icons = {
          default = "";
          performance = "";
          balanced = "";
          power-saver = "";
        };
      };
      network = {
        format-wifi = "";
        format-ethernet = "";
        format-disconnected = "⚠";
        tooltip-format-wifi = "   {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
        tooltip-format-ethernet = "  {ifname}\nIP: {ipaddr}\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
        tooltip-format-disconnected = "⚠  Disconnected";
      };
      pulseaudio = {
        format = "{icon}";
        format-bluetooth = "{icon}";
        format-bluetooth-muted = "";
        format-muted = "";
        tooltip-format = "{volume}% - {desc}";
        on-click = "pavucontrol";
        format-icons = {
          headphone = "󰋋";
          default = [
            ""
            ""
          ];
        };
      };
      "custom/notification" = {
        format = "";
        tooltip = false;
        exec = "swaync-client -sw";
        on-click = "swaync-client -t";
      };
    };
  };
}
