{ username, ... }:
{
  home-manager.users.${username}.services.kanshi = {
    enable = true;
    # systemdTarget = "graphical-session.target"; # TODO
    settings = [
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "HDMI-A-1";
            mode = "1920x1080@100Hz";
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
      }
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            transform = "normal";
          }
        ];
      }
    ];
  };
}
