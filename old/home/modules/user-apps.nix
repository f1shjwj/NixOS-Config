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
    qbittorrent
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
