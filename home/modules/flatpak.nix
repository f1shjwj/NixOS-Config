{ lib, pkgs, ... }:
{
  services.flatpak = {
    enable = true;
    update.auto.enable = false;
    uninstallUnmanaged = true;
    remotes = lib.mkOptionDefault [
      {
        name = "flathub";
        location = "https://mirrors.ustc.edu.cn/flathub";
      }
    ];
    packages = [
      "com.github.tchx84.Flatseal"
      "com.qq.QQ"
    ];
  };
}
