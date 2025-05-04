{ username, pkgs-unstable, ... }:
{
  users.users.${username}.packages = with pkgs-unstable; [
    # vscode
    gimp3
    clash-verge-rev
  ];

  home-manager.users.${username} = {
    programs.chromium = {
      enable = true;
      package = pkgs-unstable.vivaldi;
    };
  };
}
