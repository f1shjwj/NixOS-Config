{
  services.n8n = {
    enable = true;
    webhookUrl = "https://n8n.483917.xyz";
  };

  systemd.services.n8n.environment.all_proxy = "http://127.0.0.1:7890";
}
