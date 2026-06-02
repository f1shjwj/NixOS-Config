{ username, pkgs, ... }:
let
  lockCommand = "${pkgs.swaylock-effects}/bin/swaylock";
  screenOffCommand = "${pkgs.niri}/bin/niri msg action power-off-monitors";
  screenOnCommand = "${pkgs.niri}/bin/niri msg action power-on-monitors";
in
{
  home-manager.users.${username}.services.swayidle = {
    enable = true;
    events = {
      lock = lockCommand;
      before-sleep = lockCommand;
    };
    timeouts = [
      {
        timeout = 600;
        command = lockCommand;
      }
      {
        timeout = 660;
        command = screenOffCommand;
        resumeCommand = screenOnCommand;
      }
    ];
  };
}
