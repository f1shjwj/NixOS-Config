{
  networking = {
    networkmanager.enable = true;
    proxy = {
      default = "http://127.0.0.1:7897"; # http://user:password@proxy:port/
      noProxy = "127.0.0.1,localhost,internal.domain";
    };
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
