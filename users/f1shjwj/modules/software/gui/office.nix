{ pkgs, username, inputs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    wpsoffice-cn
    onlyoffice-desktopeditors
  ];

  fonts.packages = with pkgs; [
    corefonts
    vista-fonts
    vista-fonts-chs
    inputs.rewine-nur.packages.${pkgs.stdenv.hostPlatform.system}.ttf-wps-fonts
  ];
}
