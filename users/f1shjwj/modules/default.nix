{
  imports = [
    ./desktop/hyprland.nix
    ./desktop/niri.nix
    ./desktop/gamescope.nix

    ./virtual/docker.nix
    ./virtual/virtualbox.nix
    # ./virtual/waydroid.nix

    ./software/power-profiles-daemon.nix
    ./software/flatpak.nix
    ./software/steam.nix
    ./software/thunar.nix

    ./greetd.nix
    ./fcitx5.nix
    ./fonts.nix
  ];
}
