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
    foliate
    keepassxc
    follow
    qbittorrent
    lutris # TODO
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
