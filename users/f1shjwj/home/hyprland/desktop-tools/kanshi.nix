{
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
}
