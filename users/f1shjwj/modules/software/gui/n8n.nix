{ username, lib, ... }:
{
  services.n8n = {
    enable = true;
    environment = {
      WEBHOOK_URL = "https://n8n.483917.xyz";
      ALL_PROXY = "http://127.0.0.1:7890";
    };
  };

  systemd.services.cloudflared-tunnel-n8n-tunnel.serviceConfig = {
    Restart = lib.mkForce "always";
    RestartSec = 10;
  };

  services.cloudflared.tunnels."n8n-tunnel" = {
    credentialsFile = "/home/${username}/.cloudflared/n8n-tunnel.json";
    ingress = {
      "n8n.483917.xyz" = "http://localhost:5678";
    };
    default = "http_status:404";
  };
}
