{
  username,
  inputs,
  pkgs,
  lib,
  ...
}:
let
  flatpak-packages-list = [
    "com.github.tchx84.Flatseal"
    "com.qq.QQ"
    "com.tencent.WeChat"
    # "com.tencent.wemeet"
    "com.baidu.NetDisk"
    "com.usebottles.bottles"
    "runtime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/25.08"
    "com.vysp3r.ProtonPlus"
    "runtime/org.freedesktop.Platform.VulkanLayer.vkBasalt/x86_64/25.08"
  ];
in
{
  services.flatpak.enable = true;

  users.users.${username}.packages = [ pkgs.flatpak ];

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
