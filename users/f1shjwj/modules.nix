{
  imports = [
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/gamescope.nix

    ../../modules/virtual/docker.nix
    ../../modules/virtual/waydroid.nix
    ../../modules/virtual/virtualbox.nix

    ../../modules/greetd.nix
    ../../modules/fcitx5.nix
    ../../modules/fonts.nix
    ../../modules/flatpak.nix
    ../../modules/steam.nix

    ./clash.nix
  ];
}
