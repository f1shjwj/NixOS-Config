{ ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };

  services.upower.enable = true;
}
