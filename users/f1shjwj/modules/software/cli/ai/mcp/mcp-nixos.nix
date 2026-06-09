{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [
    mcp-nixos
  ];
}
