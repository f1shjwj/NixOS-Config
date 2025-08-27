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
      name = "Orchis-Dark";
      package = pkgs.orchis-theme;
    };
    iconTheme = {
      name = "Tela-blue-dark";
      package = pkgs.tela-icon-theme;
    };
    cursorTheme = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
    };
  };
}
