{ username, pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        gnome-keyring
      ];
      config = {
        niri = {
          default = [
            "gtk"
            "gnome"
          ];
          "org.freedesktop.impl.portal.Access" = [ "gtk" ];
          "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
          "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
          "org.freedesktop.impl.portal.RemoteDesktop" = [ "gnome" ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
          "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        };
      };
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
      userDirs.enable = true;
      autostart.enable = true;
      # TODO: mime
    };
  };
}
