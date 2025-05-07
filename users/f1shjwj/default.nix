let
  username = "f1shjwj";
in
{
  _module.args = { inherit username; };
  imports = [ ./modules ];

  users.groups.${username}.gid = 1000;
  users.users.${username} = {
    isNormalUser = true;
    group = "${username}";
    extraGroups = [
      "users"
      "wheel"
      "input"
    ];
    shell = "/run/current-system/sw/bin/bash";
    hashedPasswordFile = "/etc/nixos/.passwd/${username}";
  };

  home-manager.users.${username} = {
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";

    programs.home-manager.enable = true;
    home.stateVersion = "24.11";
  };
}
