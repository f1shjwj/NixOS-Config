{
  networking.proxy = {
    # http://user:password@proxy:port/
    default = "http://127.0.0.1:7897";
    noProxy = "127.0.0.1,localhost,internal.domain";
  };

  networking.firewall.allowedTCPPorts = [ 7897 ];
}
