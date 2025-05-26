{ pkgs-unstable, ... }:
{
  programs.clash-verge = {
    enable = true;
    # autoStart = true;
    package = pkgs-unstable.clash-verge-rev;
  };
}
