{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    mpv
    clash-verge-rev
    telegram-desktop
    obsidian
    libreoffice
    techmino
    okular
    keepassxc
    follow
    hmcl
    mindustry
  ];

  programs = {
    obs-studio = {
      enable = true;
    };
    chromium = {
      enable = true;
      package = pkgs.vivaldi;
    };
  };
}
