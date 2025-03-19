{
  imports = [
    ./modules
  ];

  home.username = "cmdjwj";
  home.homeDirectory = "/home/cmdjwj";

  xresources.properties = {
    "Xcursor.size" = 24;
    "Xft.dpi" = 192;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
