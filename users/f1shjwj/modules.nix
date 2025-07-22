{
  imports = [
    ./modules/desktop/niri
    ./modules/desktop/fcitx5.nix
    ./modules/desktop/startup/greetd.nix
    ./modules/desktop/startup/grub2-themes.nix
    ./modules/desktop/startup/plymouth.nix
    ./modules/desktop/core
    ./modules/desktop/core/gtk.nix
    ./modules/desktop/core/qt.nix
    ./modules/desktop/core/xdg.nix
    ./modules/desktop/core/cursor.nix
    ./modules/desktop/core/xresources-properties.nix
    ./modules/desktop/core/fonts.nix
    ./modules/desktop/desktop-tools
    ./modules/desktop/desktop-tools/waybar
    ./modules/desktop/desktop-tools/eww
    ./modules/desktop/desktop-tools/swayidle.nix
    ./modules/desktop/desktop-tools/gtklock.nix
    # ./modules/desktop/desktop-tools/kanshi.nix

    ./modules/virtual/docker.nix
    ./modules/virtual/virtualbox.nix
    # ./modules/virtual/waydroid.nix

    ./modules/software/cli
    ./modules/software/cli/alacritty
    ./modules/software/cli/btop
    ./modules/software/cli/git.nix
    ./modules/software/cli/shell
    ./modules/software/cli/shell/dir_colors
    ./modules/software/gui
    ./modules/software/gui/browser.nix
    ./modules/software/gui/flatpak.nix
    ./modules/software/gui/thunar.nix
    ./modules/software/gui/clash.nix
    ./modules/software/gui/obs-studio.nix
    ./modules/software/gui/wine.nix
    ./modules/software/gui/office.nix

    ./modules/system/i2c.nix
    ./modules/system/cups-pdf.nix
    ./modules/system/proxy.nix
    ./modules/system/power-profiles-daemon.nix
    ./modules/system/appimage.nix

    ./modules/games
    ./modules/games/gamescope.nix
  ];
}
