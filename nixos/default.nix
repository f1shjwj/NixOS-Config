{ pkgs, ... }:
{
  imports = [
    ./boot-loader.nix
    ./hardware-configuration.nix
    ./networking.nix
    ./users.nix
    ./fonts.nix
    ./fcitx5.nix
    ./virtual.nix
    ./config.nix
  ];

  nix.settings = {
    substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  networking.hostName = "jwj-nixos";
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";

  environment.variables.EDITOR = "vim";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    fd
    tree
    zip
    unzip
  ];

  # 复制 NixOS 配置文件并将其链接到生成的系统中(/run/current-system/configuration.nix)。
  # 这在你不小心删除 configuration.nix 时非常有用。
  # system.copySystemConfiguration = true;

  # 此选项定义了您在此特定机器上安装的第一个NixOS版本，用于保持与旧版NixOS上创建的应用程序数据（例如数据库）的兼容性。
  # 大多数用户在初始安装后，无论出于何种原因，都不应更改此值，即使您已将系统升级到新的 NixOS 版本。
  # 此值不会影响您的软件包和操作系统所基于的Nixpkgs版本，因此更改它不会升级您的系统。
  # 有关如何实际进行升级，请参阅 https://nixos.org/manual/nixos/stable/#sec-upgrading。
  # 此值低于当前的NixOS版本并不意味着您的系统已过时、不受支持或存在漏洞。
  # 除非您已手动检查此值将对您的配置所做的所有更改，并相应地迁移了数据，否则请勿更改此值。
  # 更多信息，请参阅 `man configuration.nix` 或访问 https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion 。
  system.stateVersion = "25.05"; # 请阅读以上内容
}
