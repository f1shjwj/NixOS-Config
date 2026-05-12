{ username, ... }:
{
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
    terminal-exec = {
      enable = true;
      settings = {
        default = [ "org.wezfurlong.wezterm.desktop" ];
      };
    };
  };

  home-manager.users.${username} = {
    xdg = {
      configFile."mimeapps.list".force = true;
      userDirs = {
        enable = true;
        setSessionVariables = true;
      };
      autostart.enable = true;
      mimeApps = {
        enable = true;
        defaultApplications = {
          "application/gzip" = [ "org.gnome.FileRoller.desktop" ];
          "application/java-archive" = [ "org.gnome.FileRoller.desktop" ];
          "application/json" = [ "org.gnome.TextEditor.desktop" ];
          "application/pdf" = [ "onlyoffice-desktopeditors.desktop" ];
          "application/vnd.apple.mpegurl" = [ "org.gnome.TextEditor.desktop" ];
          "application/vnd.ms-cab-compressed" = [ "org.gnome.FileRoller.desktop" ];
          "application/vnd.rar" = [ "org.gnome.FileRoller.desktop" ];
          "application/wps-office.doc" = [ "onlyoffice-desktopeditors.desktop" ];
          "application/wps-office.docx" = [ "onlyoffice-desktopeditors.desktop" ];
          "application/x-7z-compressed" = [ "org.gnome.FileRoller.desktop" ];
          "application/x-bzip" = [ "org.gnome.FileRoller.desktop" ];
          "application/x-bzip-compressed-tar" = [ "org.gnome.FileRoller.desktop" ];
          "application/x-compressed-tar" = [ "org.gnome.FileRoller.desktop" ];
          "application/x-extension-htm" = [ "zen-beta.desktop" ];
          "application/x-extension-html" = [ "zen-beta.desktop" ];
          "application/x-extension-shtm" = [ "zen-beta.desktop" ];
          "application/x-extension-shtml" = [ "zen-beta.desktop" ];
          "application/x-extension-xht" = [ "zen-beta.desktop" ];
          "application/x-extension-xhtml" = [ "zen-beta.desktop" ];
          "application/xhtml+xml" = [ "zen-beta.desktop" ];
          "application/x-tar" = [ "org.gnome.FileRoller.desktop" ];
          "application/zip" = [ "org.gnome.FileRoller.desktop" ];
          "application/zstd" = [ "org.gnome.FileRoller.desktop" ];
          "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
          "image/avif" = [ "org.gnome.Loupe.desktop" ];
          "image/bmp" = [ "org.gnome.Loupe.desktop" ];
          "image/gif" = [ "org.gnome.Loupe.desktop" ];
          "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
          "image/png" = [ "org.gnome.Loupe.desktop" ];
          "image/svg+xml" = [ "org.gnome.Loupe.desktop" ];
          "image/svg+xml-compressed" = [ "org.gnome.Loupe.desktop" ];
          "image/tiff" = [ "org.gnome.Loupe.desktop" ];
          "image/webp" = [ "org.gnome.Loupe.desktop" ];
          "text/html" = [ "zen-beta.desktop" ];
          "text/markdown" = [ "litemdview.desktop" ];
          "text/plain" = [ "org.gnome.TextEditor.desktop" ];
          "text/x-python" = [ "code.desktop" ];
          "x-scheme-handler/chrome" = [ "zen-beta.desktop" ];
          "x-scheme-handler/http" = [ "zen-beta.desktop" ];
          "x-scheme-handler/https" = [ "zen-beta.desktop" ];
          "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];
          "x-scheme-handler/tonsite" = [ "org.telegram.desktop.desktop" ];
        };
      };
    };
  };
}
