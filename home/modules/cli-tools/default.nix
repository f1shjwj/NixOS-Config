{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim # TODO
    nixfmt-rfc-style
    ueberzugpp
  ];

  programs = {
    git = {
      enable = true;
      userName = "cmdjwj";
      userEmail = "jwjawa@outlook.com";
    };
    yazi = {
      enable = true;
    };
    btop = {
      enable = true;
      extraConfig = builtins.readFile ./btop.conf;
    };
    fastfetch = {
      enable = true;
      # settings =
    };
  };
}
