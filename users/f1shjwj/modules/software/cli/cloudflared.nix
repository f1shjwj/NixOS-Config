{
  username,
  pkgs,
  lib,
  ...
}:
{
  systemd.services.cloudflared-tunnel-n8n-tunnel.serviceConfig = {
    Restart = lib.mkForce "always";
    RestartSec = 10;
  };

  users.users.${username}.packages = [ pkgs.cloudflared ];

  services.cloudflared = {
    enable = true;
    tunnels."n8n-tunnel" = {
      credentialsFile = "/home/${username}/.cloudflared/n8n-tunnel.json";
      ingress = {
        "n8n.483917.xyz" = "http://localhost:5678";
      };
      default = "http_status:404";
    };
  };
}
