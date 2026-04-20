{ pkgs, ... }:
let
  username = "f1shjwj";
in
{
  _module.args = { inherit username; };
  imports = [ ./modules.nix ];

  users.groups.${username}.gid = 1000;
  users.users.${username} = {
    isNormalUser = true;
    group = "${username}";
    extraGroups = [
      "users"
      "wheel"
      "input"
      "podman"
    ];
    shell = pkgs.bashInteractive;
    hashedPasswordFile = "/etc/nixos/.secret/passwd/${username}";
  };

  home-manager.users.${username} = {
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";

    programs.home-manager.enable = true;
    home.stateVersion = "25.05";
  };
}
