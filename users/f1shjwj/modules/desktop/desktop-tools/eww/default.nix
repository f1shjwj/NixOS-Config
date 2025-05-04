{ username, ... }:
{
  home-manager.users.${username}.programs.eww = {
    enable = true;
    configDir = ./eww-config-dir;
  };
}
