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

  home-manager.users.${username} = {
    xdg.desktopEntries.litemdview = {
      name = "litemdview";
      exec = "litemdview %u";
      mimeType = [ "text/markdown" ];
      terminal = false;
      type = "Application";
      categories = [ "Utility" ];
      comment = "Suckless markdown viewer";
    };
  };
}
