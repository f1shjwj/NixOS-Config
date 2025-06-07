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
    ./software/dir_colors
    ./software/shell.nix
    ./software/power-profiles-daemon.nix
    ./software/flatpak.nix
    ./software/games.nix
    ./software/thunar.nix
    ./software/unstable.nix
    ./software/obs-studio.nix

    ./greetd.nix
    ./fcitx5.nix
    ./fonts.nix
    ./grub2-themes.nix
    ./i2c.nix
    ./wine.nix
    ./cups-pdf.nix
  ];
}
