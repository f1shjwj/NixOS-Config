{ username, ... }:
{
  security.polkit.enable = true;

  home-manager.users.${username} = {
    services.polkit-gnome.enable = true;
  };
}
