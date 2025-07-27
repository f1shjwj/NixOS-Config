let
  port = 7897;
in
{
  networking.proxy = {
    # http://user:password@proxy:port/
    default = "http://127.0.0.1:${toString port}";
    noProxy = "127.0.0.1,localhost,internal.domain";
  };

  networking.firewall.allowedTCPPorts = [ port ];

  programs.clash-verge.enable = true;
}
