{ username, pkgs, ... }:
{
  home-manager.users.${username} = {
    home.pointerCursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 24;
      gtk.enable = true;
    };
  };
}
