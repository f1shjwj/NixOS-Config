{ username, pkgs-unstable, ... }:
{
  users.users.${username}.packages = with pkgs-unstable; [
    gimp3
    clash-verge-rev
  ];
}
