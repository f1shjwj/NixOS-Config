{
  imports = [ ./modules ];

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
      "vboxusers"
    ];
    shell = "/run/current-system/sw/bin/bash";
    hashedPasswordFile = "/etc/nixos/.passwd/f1shjwj";
  };

  home-manager.users.f1shjwj = {
    imports = [ ./home ];

    home.username = "f1shjwj";
    home.homeDirectory = "/home/f1shjwj";

    programs.home-manager.enable = true;
    home.stateVersion = "24.11";
  };
}
