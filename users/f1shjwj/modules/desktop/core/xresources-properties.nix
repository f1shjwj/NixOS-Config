{ username, ... }:
{
  home-manager.users.${username} = {
    xresources.properties = {
      "Xcursor.size" = 24;
      "Xft.dpi" = 192;
    };
  };
}
