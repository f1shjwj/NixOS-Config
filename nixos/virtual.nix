{
  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      daemon.settings = {
        userland-proxy = false;
      };
    };
    # https://nixos.wiki/wiki/WayDroid
    waydroid.enable = true;
  };
}
