{ username, pkgs, ... }:
{
  security.pam.services.swaylock = { };

  users.users.${username}.packages = [
    pkgs.swaylock-effects
  ];

  home-manager.users.${username}.xdg.configFile."swaylock/config".text = ''
    screenshots
    effect-scale=0.5
    effect-blur=11x6
    effect-scale=2
    effect-vignette=0.45:0.45

    clock
    indicator
    indicator-radius=150
    indicator-thickness=8
    timestr=%H:%M
    datestr=%Y-%m-%d %a
    font=Sans
    font-size=100

    text-color=d4d4d4
    text-clear-color=d4d4d4
    text-ver-color=d4d4d4
    text-wrong-color=ffffff
    inside-color=0b1220cc
    inside-clear-color=0b1220cc
    inside-ver-color=0b1220dd
    inside-wrong-color=2a1018dd
    ring-color=4fc1ffdd
    ring-clear-color=4ec9b0dd
    ring-ver-color=9cdcfeee
    ring-wrong-color=f44747ee
    key-hl-color=ffffffee
    bs-hl-color=f44747ee
    line-color=00000000
    separator-color=00000000
  '';
}
