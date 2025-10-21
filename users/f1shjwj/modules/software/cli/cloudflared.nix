{ username, pkgs, ... }:
{
  users.users.${username}.packages = [ pkgs.cloudflared ];

  services.cloudflared.enable = true;
}
