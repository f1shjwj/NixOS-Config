{
  username,
  pkgs,
  ...
}:
{
  users.users.${username}.packages = with pkgs; [
    # 开发工具
    neovim # TODO
    gnumake

    # Nix 相关工具
    nh
    nixfmt
    nixd
    nix-search-tv
    cachix

    # 通用命令行工具
    ueberzugpp
    openssl
    nix-tree
    you-get
    shell-gpt # TODO: config
    gh
    fzf
    wev
    tty-clock
    ffmpeg
    pandoc
    imagemagick
    ncdu
    dig
    ripgrep
    jq
    tmux # TODO: module
  ];

  home-manager.users.${username}.programs.yazi = {
    enable = true;
    shellWrapperName = "yy";
  };
}
