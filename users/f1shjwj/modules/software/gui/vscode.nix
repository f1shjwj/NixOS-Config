{
  username,
  pkgs,
  ...
}:
{
  users.users.${username}.packages = with pkgs; [
    (
      (vscode.override {
        commandLineArgs = "--enable-wayland-ime=true --wayland-text-input-version=3";
      }).fhsWithPackages
      (ps: [
        ps.nodejs
        ps.uv
      ])
    )
    (code-cursor.override {
      commandLineArgs = "--enable-wayland-ime=true --wayland-text-input-version=3";
    })
  ];
}
