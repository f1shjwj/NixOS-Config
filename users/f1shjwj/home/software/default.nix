{ pkgs, ... }:
{
  imports = [
    ./alacritty
    ./btop
    ./shell.nix
  ];

  home.packages =
    with pkgs;
    [
      neovim # TODO
      ueberzugpp
      openssl
      nix-tree
      you-get
      shell-gpt # TODO: config
      fzf
    ]
    ++ [
      vscode
      gnumake
      lazydocker
      nixfmt-rfc-style
      nixd
      hyprls
    ]
    ++ [
      firefox
      mpv
      clash-verge-rev
      telegram-desktop
      obsidian
      libreoffice
      techmino
      foliate
      keepassxc
      follow
      qbittorrent
      lutris # TODO
    ];

  programs = {
    yazi = {
      enable = true;
    };
    fastfetch = {
      enable = true;
      # settings
    };
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
    # zellij = {
    #   enable = true;
    #   enableFishIntegration = true;
    # };
    obs-studio = {
      enable = true;
    };
    chromium = {
      enable = true;
      package = pkgs.vivaldi;
    };
  };
}
