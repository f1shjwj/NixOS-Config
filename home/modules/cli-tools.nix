{ pkgs, ... }:
{
  home.packages = with pkgs; [
    btop
    yazi
    neovim
    fastfetch
    nixfmt-rfc-style
  ];

  programs.git = {
    enable = true;
    userName = "cmdjwj";
    userEmail = "jwjawa@outlook.com";
  };
}
