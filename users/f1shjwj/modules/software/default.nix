{ username, pkgs, ... }:
{
  users.users.${username}.packages =
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

  home-manager.users.${username}.programs = {
    yazi = {
      enable = true;
    };
    fastfetch = {
      enable = true;
    };
    direnv.enable = true;
    git = {
      enable = true;
      userName = "F1shjwj";
      userEmail = "jwjawa@outlook.com";
    };
    lazygit = {
      enable = true;
    };
    obs-studio = {
      enable = true;
    };
  };
}
