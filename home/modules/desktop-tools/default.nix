{ pkgs, ... }:
{
  home.packages = with pkgs; [
    udiskie
    mako
    # SwayNotificationCenter
    waybar
    wlogout
    networkmanagerapplet
    wofi
    xdg-user-dirs
    wl-clipboard
    cliphist
    pavucontrol
    ddcutil
    # slurp    # 区域选择器
    # gnome.zenity # 图形弹窗
  ];

  services.blueman-applet.enable = true;
  services.mpris-proxy.enable = true;

  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    settings = [
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "HDMI-A-1";
            position = "0,0";
            mode = "1920x1080@100Hz";
          }
          {
            criteria = "eDP-1";
            position = "1920,0";
            transform = "270";
          }
        ];
      }
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            position = "0,0";
            transform = "normal";
          }
        ];
      }
    ];
  };

  # programs = {
  #   waybar = {
  #     enable = true;
  #     settings = builtins.readFile ./config.jsonc;
  #     style = ./style.css;
  #     systemd = {
  #       enable = true;
  #       target = "hyprland-session.target";
  #     };
  #   };
  # };
}
