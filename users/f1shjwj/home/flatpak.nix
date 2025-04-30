{ lib, ... }:
{
  # https://github.com/gmodena/nix-flatpak/

  services.flatpak = {
    enable = true;
    update.auto.enable = false;
    uninstallUnmanaged = true;
  };

  services.flatpak.packages = [
    "com.github.tchx84.Flatseal"
    "com.qq.QQ"
    "com.tencent.WeChat"
  ];

  services.flatpak.remotes = lib.mkOptionDefault [
    {
      name = "flathub";
      location = "https://mirrors.ustc.edu.cn/flathub";
    }
  ];
}
