{ username, pkgs, ... }:
let
  litemdview-patched = pkgs.litemdview.overrideAttrs (prev: {
    postPatch = (prev.postPatch or "") + ''
      sed -i '/^extern long int strtol();$/d' xxd/xxd.c
      sed -i '/^extern long int ftell();$/d' xxd/xxd.c
    '';
  });
in
{
  users.users.${username}.packages = [ litemdview-patched ];
}
