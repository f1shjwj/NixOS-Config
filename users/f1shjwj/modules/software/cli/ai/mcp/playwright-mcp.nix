{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [
    playwright-test
    playwright-mcp
  ];
}
