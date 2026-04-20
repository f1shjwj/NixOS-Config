{ pkgs, ... }:
let
  graphicalSessionTarget = [ "graphical-session.target" ];
in
{
  systemd.user.services = {
    wl-paste = {
      description = "wl-paste as a daemon";
      partOf = graphicalSessionTarget;
      after = graphicalSessionTarget;
      requisite = graphicalSessionTarget;
      wantedBy = graphicalSessionTarget;
      serviceConfig = {
        ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store";
        Restart = "on-failure";
      };
    };

  };
}
