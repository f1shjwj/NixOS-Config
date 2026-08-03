{
  username,
  pkgs,
  ...
}:
{
  users.users.${username}.packages = with pkgs; [
    (vscode.override {
      commandLineArgs = "--enable-wayland-ime=true --wayland-text-input-version=3";
    })
    # (code-cursor.override {
    #   commandLineArgs = "--enable-wayland-ime=true --wayland-text-input-version=3";
    # })
  ];
}
