{
  imports = [
    ./desktop/hyprland.nix
    ./desktop/niri.nix
    ./desktop/gamescope.nix

    ./virtual/docker.nix
    # ./virtual/waydroid.nix
    ./virtual/virtualbox.nix

    ./greetd.nix
    ./fcitx5.nix
    ./fonts.nix
    ./power-profiles-daemon.nix
    ./flatpak.nix
    ./steam.nix
    ./thunar.nix
  ];
}
