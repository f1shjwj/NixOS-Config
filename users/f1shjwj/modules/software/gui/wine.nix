{ username, pkgs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    wineWow64Packages.stable
    winetricks
  ];
}
