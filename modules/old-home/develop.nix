{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode
    gnumake
    lazydocker
    nixfmt-rfc-style
    nixd
    hyprls
  ];

  programs = {
    direnv.enable = true;
    git = {
      enable = true;
      userName = "F1shjwj";
      userEmail = "jwjawa@outlook.com";
    };
    lazygit = {
      enable = true;
      # settings
    };
  };
}
