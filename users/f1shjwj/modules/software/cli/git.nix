{ username, ... }:
{
  home-manager.users.${username}.programs = {
    git = {
      enable = true;
      userName = "F1shjwj";
      userEmail = "jwjawa@outlook.com";
    };
    lazygit = {
      enable = true;
    };
  };
}
