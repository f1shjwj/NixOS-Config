{ username, ... }:
{
  home-manager.users.${username}.qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "adwaita";
  };
}
