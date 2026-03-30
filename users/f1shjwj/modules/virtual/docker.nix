{ username, pkgs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    podman
    podman-compose
  ];

  virtualisation = {
    containers.enable = true;
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  home-manager.users.${username} = {
    programs.lazydocker.enable = true;
  };
}
