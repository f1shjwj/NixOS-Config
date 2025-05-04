{ pkgs, ... }:
{
  imports = [
    ./alacritty
    ./btop
    ./flatpak.nix
    ./shell.nix
    ./unstable.nix
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
      feh
      telegram-desktop
      obsidian
      libreoffice
      techmino
      foliate
      keepassxc
      follow
      qbittorrent
      lutris # TODO
      xfce.mousepad
    ];

  programs.yazi = {
    enable = true;
  };
  programs.fastfetch = {
    enable = true;
  };
  programs.direnv.enable = true;
  programs.git = {
    enable = true;
    userName = "F1shjwj";
    userEmail = "jwjawa@outlook.com";
  };
  programs.lazygit = {
    enable = true;
  };
  programs.obs-studio = {
    enable = true;
  };
}
