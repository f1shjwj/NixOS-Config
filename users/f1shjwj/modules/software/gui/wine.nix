{ username, pkgs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    wineWowPackages.stable
    winetricks
  ];
}
