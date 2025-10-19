{ pkgs, ... }:
let
  proxyPort = 7890;
  localConfig = ./mihomo/nachoneko.yaml;
in
{
  networking.proxy = {
    # http://user:password@proxy:port/
    default = "http://127.0.0.1:${toString proxyPort}";
    noProxy = "127.0.0.1,localhost,internal.domain";
  };

  networking.firewall.allowedTCPPorts = [ proxyPort ];

  services.mihomo = {
    enable = true;
    webui = pkgs.zashboard;
    configFile = localConfig;
  };
}
