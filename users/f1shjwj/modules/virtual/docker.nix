{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
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
