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

    qq = {
      description = "QQ";
      partOf = graphicalSessionTarget;
      after = graphicalSessionTarget;
      requisite = graphicalSessionTarget;
      wantedBy = graphicalSessionTarget;
      serviceConfig = {
        ExecStart = "${pkgs.flatpak}/bin/flatpak run com.qq.QQ --enable-wayland-ime --wayland-text-input-version=3";
        Restart = "on-failure";
      };
    };
  };
}
