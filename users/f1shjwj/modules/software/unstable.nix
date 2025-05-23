{ username, pkgs-unstable, ... }:
{
  users.users.${username}.packages = with pkgs-unstable; [
    gimp3
  ];

  programs.clash-verge = {
    enable = true;
    # autoStart = true;
    package = pkgs-unstable.clash-verge-rev;
  };
}
