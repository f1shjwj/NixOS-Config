{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [
    wpsoffice-cn
  ];

  fonts.packages = with pkgs; [
    corefonts
    vista-fonts
    vista-fonts-chs
    nur.repos.rewine.ttf-wps-fonts
  ];
}
