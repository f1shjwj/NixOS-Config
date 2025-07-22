{ username, pkgs, ... }:
{
  users.groups.docker.members = [ username ];

  users.users.${username}.packages = with pkgs; [
    docker-compose
  ];

  home-manager.users.${username}.programs = {
    lazydocker.enable = true;
  };

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    daemon.settings = {
      userland-proxy = false;
      registry-mirrors = [
        "https://dockerproxy.com"
        "https://dockerpull.cn"
        "https://docker.1panelproxy.com"
      ];
    };
  };
}
