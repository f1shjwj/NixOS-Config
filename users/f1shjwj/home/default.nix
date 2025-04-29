{
  imports = [
    ./hyprland
    ./software
    ./flatpak.nix
  ];

  xresources.properties = {
    "Xcursor.size" = 24;
    "Xft.dpi" = 192;
  };
}
