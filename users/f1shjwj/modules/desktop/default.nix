{ username, pkgs, ... }:
{
  home-manager.users.${username} = {
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    xresources.properties = {
      "Xcursor.size" = 24;
      "Xft.dpi" = 192;
    };

    gtk = {
      enable = true;
      gtk2 = {
        # configLocation = "$HOME/.config/gtk-2.0/gtkrc";
        extraConfig = ''gtk-im-module="fcitx"'';
      };
      gtk3.extraConfig = {
        gtk-im-module = ''fcitx'';
      };
      gtk4.extraConfig = {
        gtk-im-module = ''fcitx'';
      };
      # theme,iconTheme,cursorTheme
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
  };
}
