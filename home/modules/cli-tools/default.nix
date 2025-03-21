{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim # TODO
    nixfmt-rfc-style
    ueberzugpp
    lazydocker
    openssl
  ];

  programs = {
    git = {
      enable = true;
      userName = "cmdjwj";
      userEmail = "jwjawa@outlook.com";
    };
    lazygit = {
      enable = true;
      # settings
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
      # settings
    };
  };
}
