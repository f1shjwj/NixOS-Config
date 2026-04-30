{
  username,
  pkgs,
  ...
}:
{
  users.users.${username}.packages = with pkgs; [
    zed-editor-fhs
  ];
}
