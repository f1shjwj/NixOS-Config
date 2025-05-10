{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  networking.hostName = "F1shjwj-Code01";

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.supportedLocales = [
    "zh_CN.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
  ];

  environment.variables.EDITOR = "vim";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings = {
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    trusted-users = [
      "root"
      "f1shjwj"
    ];
    max-jobs = 2;
  };

  system.stateVersion = "25.05";
}
