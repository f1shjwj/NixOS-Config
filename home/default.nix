{ pkgs, ... }:
{
  imports = [
    ./modules
  ];

  home.username = "cmdjwj";
  home.homeDirectory = "/home/cmdjwj";

  xresources.properties = {
    "Xcursor.size" = 24;
    "Xft.dpi" = 192;
  };

  home.pointerCursor =
    let
      getFrom = url: hash: name: {
        gtk.enable = true;
        x11.enable = true;
        name = name;
        size = 24;
        package = pkgs.runCommand "moveUp" { } ''
          mkdir -p $out/share/icons
          ln -s ${
            pkgs.fetchzip {
              url = url;
              hash = hash;
            }
          } $out/share/icons/${name}
        '';
      };
    in
    getFrom
      "https://github.com/guillaumeboehm/Nordzy-cursors/releases/download/v2.3.0/Nordzy-hyprcursors.tar.gz"
      "sha256-V88FDWQfDc6fIbCI4ZnsPWuypq8HZ91IsipPcI/tDfk="
      "Nordzy-Cursors";

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
