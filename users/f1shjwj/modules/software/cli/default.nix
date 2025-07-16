{
  username,
  pkgs,
  pkgs-unstable,
  ...
}:

let
  # 开发工具
  dev-tools = with pkgs; [
    neovim # TODO
    gnumake
  ];

  # Nix 相关工具
  nix-tools = with pkgs; [
    nixfmt-rfc-style
    nixd
    nix-search-tv
    cachix
  ];

  # 通用命令行工具
  general = with pkgs; [
    ueberzugpp
    openssl
    nix-tree
    you-get
    shell-gpt # TODO: config
    fzf
    wev
    tty-clock
    ffmpeg
    pandoc
    imagemagick
  ];

  # 来自不稳定源的包
  unstable-packages = with pkgs-unstable; [
    gemini-cli
  ];

in
{
  users.users.${username}.packages = (dev-tools ++ nix-tools ++ general ++ unstable-packages);

  home-manager.users.${username}.programs = {
    yazi = {
      enable = true;
    };
    fastfetch = {
      enable = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
