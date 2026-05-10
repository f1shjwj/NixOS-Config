{
  username,
  pkgs,
  ...
}:
{
  users.users.${username}.packages = with pkgs; [
    (zed-editor.fhsWithPackages (ps: [
      ps.nodejs
      ps.uv
    ]))
  ];
}
