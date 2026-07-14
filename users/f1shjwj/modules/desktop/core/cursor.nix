{ username, pkgs, ... }:
{
  home-manager.users.${username} = {
    home.pointerCursor = {
      enable = true;
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 24;
      gtk.enable = true;
    };
  };
}
