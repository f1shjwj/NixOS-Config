{ username, ... }:
{
  home-manager.users.${username}.programs = {
    git = {
      enable = true;
      settings.user = {
        name = "F1shjwj";
        email = "jwjawa@outlook.com";
      };
    };
    lazygit = {
      enable = true;
    };
  };
}
