{ pkgs-unstable, username, ... }:
{
  users.users.${username}.packages = with pkgs-unstable; [ noctalia-shell ];

  services.upower.enable = true;
}
