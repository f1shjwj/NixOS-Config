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
      "i2c"
      "docker"
    ];
    shell = "/run/current-system/sw/bin/bash";
  };
}
