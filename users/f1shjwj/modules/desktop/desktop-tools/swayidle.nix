{ username, pkgs, ... }:
let
  lockCommand = "${pkgs.systemd}/bin/loginctl lock-session";
  gtklockCommand = "${pkgs.gtklock}/bin/gtklock";
  niriCommand = "${pkgs.niri}/bin/niri msg action power-off-monitors";
in
{
  home-manager.users.${username}.services.swayidle = {
    enable = true;
    events = [
      {
        event = "lock";
        command = gtklockCommand;
      }
      {
        event = "before-sleep";
        command = lockCommand;
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = niriCommand;
      }
      {
        timeout = 610;
        command = lockCommand;
      }
    ];
  };
}
