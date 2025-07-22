{ username, pkgs, ... }:
{
  home-manager.users.${username}.gtk = {
    enable = true;

    theme = {
      name = "Orchis-Light";
      package = pkgs.orchis-theme;
    };
    iconTheme = {
      name = "Tela-blue-light";
      package = pkgs.tela-icon-theme;
    };
  };
}
