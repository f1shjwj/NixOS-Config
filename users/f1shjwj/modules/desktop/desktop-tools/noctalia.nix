{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [ noctalia-shell ];

  services.upower.enable = true;
}
