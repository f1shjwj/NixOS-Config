let
  proxyPort = 2080;
  localConfig = ./sing-box/config.json;
in
{
  networking.proxy = {
    # http://user:password@proxy:port/
    default = "http://127.0.0.1:${toString proxyPort}";
    noProxy = "127.0.0.1,localhost,internal.domain";
  };

  networking.firewall.allowedTCPPorts = [ proxyPort ];

  services.sing-box = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile localConfig);
  };
}
