{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    # vscode
    gimp3
    clash-verge-rev
  ];

  programs.chromium = {
    enable = true;
    package = pkgs-unstable.vivaldi;
  };
}
