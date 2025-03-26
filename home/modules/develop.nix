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
      userName = "cmdjwj";
      userEmail = "jwjawa@outlook.com";
    };
    lazygit = {
      enable = true;
      # settings
    };
  };
}
