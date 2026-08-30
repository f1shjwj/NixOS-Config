{ username, pkgs, ... }:
let
  lofi = pkgs.writeShellApplication {
    name = "lofi";
    runtimeInputs = [ pkgs.mpv pkgs.tmux pkgs.socat ];
    text = builtins.readFile ./lofi.sh;
  };
in
{
  users.users.${username}.packages = [ lofi ];

  home-manager.users.${username} = {
    xdg.desktopEntries."lofigirl" = {
      name = "Lofigirl";
      comment = "Toggle lofigirl radio (Bilibili live, audio only)";
      exec = "lofi";
      icon = "multimedia-player";
      terminal = false;
      categories = [ "Audio" ];
    };
  };
}
