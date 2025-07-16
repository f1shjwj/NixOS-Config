{ username, ... }:
{
  home-manager.users.${username} = {
    home.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
