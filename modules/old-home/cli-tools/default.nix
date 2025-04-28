{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim # TODO
    ueberzugpp
    openssl
    nix-tree
    you-get
    shell-gpt # TODO: config
    fzf
  ];

  programs = {
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
