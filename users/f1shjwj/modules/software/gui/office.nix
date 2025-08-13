{
  pkgs,
  username,
  inputs,
  ...
}:
{
  users.users.${username}.packages = with pkgs; [
    wpsoffice-cn
  ];

  nixpkgs.overlays = [ inputs.chinese-fonts-overlay.overlays.default ];

  fonts.packages = with pkgs; [
    corefonts
    vista-fonts
    vista-fonts-chs
    windows-fonts
    nur.repos.rewine.ttf-wps-fonts
  ];
}
