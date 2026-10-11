{ ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };

  services.upower = {
    enable = true;
    percentageAction = 2;
    criticalPowerAction = "PowerOff";
  };
}
