{
  imports = [
    ./modules
  ];

  home.username = "cmdjwj";
  home.homeDirectory = "/home/cmdjwj";

  xresources.properties = {
    "Xcursor.size" = 12;
    "Xft.dpi" = 144;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
