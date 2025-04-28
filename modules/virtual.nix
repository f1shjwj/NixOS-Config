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
  users.extraGroups.docker.members = [ "f1shjwj" ];

  # https://nixos.wiki/wiki/WayDroid
  virtualisation.waydroid.enable = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "f1shjwj" ];
}
