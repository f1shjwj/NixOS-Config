{ username, ... }:
{
  home-manager.users.${username}.programs.btop = {
    enable = true;
    extraConfig = builtins.readFile ./btop.conf;
  };
}
