{
  imports = [
    ./desktop
    ./desktop/niri
    ./desktop/gamescope.nix

    ./desktop/desktop-tools
    ./desktop/desktop-tools/waybar
    ./desktop/desktop-tools/eww

    ./virtual/docker.nix
    ./virtual/virtualbox.nix
    # ./virtual/waydroid.nix

    ./software
    ./software/alacritty
    ./software/btop
    ./software/shell.nix
    ./software/power-profiles-daemon.nix
    ./software/flatpak.nix
    ./software/games.nix
    ./software/thunar.nix
    ./software/unstable.nix

    ./greetd.nix
    ./fcitx5.nix
    ./fonts.nix
  ];
}
