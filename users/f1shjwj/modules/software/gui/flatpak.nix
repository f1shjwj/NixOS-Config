{
  username,
  inputs,
  lib,
  ...
}:
let
  flatpak-packages-list = [
    "com.github.tchx84.Flatseal"
    "com.qq.QQ"
    "com.tencent.WeChat"
    "com.tencent.wemeet"
    "com.baidu.NetDisk"
  ];
in
{
  services.flatpak.enable = true;

  # https://github.com/gmodena/nix-flatpak/
  home-manager.users.${username} = {
    imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

    services.flatpak = {
      enable = true;
      packages = flatpak-packages-list;
      update.auto.enable = false;
      uninstallUnmanaged = true;
      remotes = lib.mkOptionDefault [
        {
          name = "flathub";
          location = "https://mirrors.ustc.edu.cn/flathub";
        }
      ];
    };
  };
}
