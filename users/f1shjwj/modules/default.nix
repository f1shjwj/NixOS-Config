{
  imports = [
    ./desktop/hyprland
    ./desktop/niri.nix
    ./desktop/gamescope.nix

    ./virtual/docker.nix
    ./virtual/virtualbox.nix
    # ./virtual/waydroid.nix

    ./software
    ./software/alacritty
    ./software/btop
    ./software/shell.nix
    ./software/power-profiles-daemon.nix
    ./software/flatpak.nix
    ./software/steam.nix
    ./software/thunar.nix
    ./software/unstable.nix

    ./greetd.nix
    ./fcitx5.nix
    ./fonts.nix
  ];
}
