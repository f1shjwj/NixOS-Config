{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [
    wpsoffice-cn
  ];

  fonts.packages = with pkgs; [
    corefonts
    windows-fonts
    nur.repos.rewine.ttf-wps-fonts
  ];
}
