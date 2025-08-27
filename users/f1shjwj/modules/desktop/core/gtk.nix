{ username, pkgs, ... }:
{
  home-manager.users.${username}.gtk = {
    enable = true;

    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme;
    };
    iconTheme = {
      name = "Tela-blue-dark";
      package = pkgs.tela-icon-theme;
    };
  };
}
