{
  networking.networkmanager.enable = true;

  networking.proxy = {
    default = "http://127.0.0.1:7897"; # http://user:password@proxy:port/
    noProxy = "127.0.0.1,localhost,internal.domain";
  };

  networking.firewall.allowedTCPPorts = [ 7897 ];

  networking.firewall.enable = true;
}
