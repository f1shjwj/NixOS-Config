{
  username,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  users.users.${username}.packages =
    (with pkgs; [
      # 开发工具
      neovim # TODO
      gnumake
      devenv

      # Nix 相关工具
      nh
      nixfmt-rfc-style
      nixd
      nix-search-tv
      cachix

      # 通用命令行工具
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
    ])
    ++ (with pkgs-unstable; [
      gemini-cli
    ]);

  home-manager.users.${username}.programs = {
    yazi = {
      enable = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
