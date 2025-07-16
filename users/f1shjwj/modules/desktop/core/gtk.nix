{ username, ... }:
{
  home-manager.users.${username}.gtk = {
    enable = true;
    # gtk2.configLocation = "$HOME/.config/gtk-2.0/gtkrc";
    # theme,iconTheme,cursorTheme
  };
}
