{ username, pkgs, ... }:
{
  users.users.${username}.packages = [ pkgs.devenv ];

  home-manager.users.${username}.programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
