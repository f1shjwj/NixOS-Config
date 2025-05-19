{ username, ... }:
{
  home-manager.users.${username} = {
    programs.dircolors = {
      enable = true;
    };
  };
}
