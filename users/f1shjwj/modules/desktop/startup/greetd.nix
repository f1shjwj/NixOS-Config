{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
  };

  programs.regreet = {
    enable = true;
    cageArgs = [
      "-s"
      "-mlast"
    ];
    theme = {
      name = "Orchis-Light";
      package = pkgs.orchis-theme;
    };
    iconTheme = {
      name = "Tela-blue-light";
      package = pkgs.tela-icon-theme;
    };
    cursorTheme = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
    };
  };
}
