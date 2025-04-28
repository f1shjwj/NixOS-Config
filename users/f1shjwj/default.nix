{ inputs, ... }:
{
  imports = [
    ../../modules/base-packages.nix
    ../../modules/kde.nix
    ../../modules/fcitx5.nix
    ../../modules/fonts.nix
    ../../modules/steam.nix
    ../../modules/virtual.nix
    ../../modules/flatpak.nix
  ];
  users.groups.f1shjwj.gid = 1000;
  users.users.f1shjwj = {
    isNormalUser = true;
    group = "f1shjwj";
    extraGroups = [
      "users"
      "wheel"
      "input"
    ];
    shell = "/run/current-system/sw/bin/bash";
  };
  home-manager.users.f1shjwj = {
    imports = [
      ../../modules/home
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];
    home.username = "f1shjwj";
    home.homeDirectory = "/home/f1shjwj";

    xresources.properties = {
      "Xcursor.size" = 24;
      "Xft.dpi" = 192;
    };

    programs.home-manager.enable = true;
    home.stateVersion = "24.11";
  };
}
