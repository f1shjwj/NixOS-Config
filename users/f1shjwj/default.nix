let
  username = "f1shjwj";
in
{
  imports = [ ./modules ];

  _module.args = { inherit username; };

  users.groups.${username}.gid = 1000;
  users.users.${username} = {
    isNormalUser = true;
    group = "${username}";
    extraGroups = [
      "users"
      "wheel"
      "input"

      "i2c"
    ];
    shell = "/run/current-system/sw/bin/bash";
    hashedPasswordFile = "/etc/nixos/.passwd/${username}";
  };

  home-manager.users.${username} = {
    imports = [ ./old-home ];

    home.username = "${username}";
    home.homeDirectory = "/home/${username}";

    programs.home-manager.enable = true;
    home.stateVersion = "24.11";
  };
}
