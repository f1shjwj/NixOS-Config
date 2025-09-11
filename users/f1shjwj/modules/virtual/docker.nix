{ username, pkgs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    podman-compose
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  home-manager.users.${username} = {
    programs.lazydocker.enable = true;
  };
}
