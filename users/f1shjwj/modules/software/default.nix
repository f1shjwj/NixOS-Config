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
      wev
      tty-clock
    ]
    ++ [
      (vscode.override {
        commandLineArgs = "--enable-wayland-ime=true --wayland-text-input-version=3";
      })
      gnumake
      nixfmt-rfc-style
      nixd
      hyprls
      cachix
      beekeeper-studio
    ]
    ++ [
      firefox
      mpv
      feh
      telegram-desktop
      obsidian
      techmino
      foliate
      keepassxc
      follow
      qbittorrent
      xfce.mousepad
      wpsoffice-cn
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
    chromium = {
      enable = true;
      package = (
        pkgs.vivaldi.override {
          commandLineArgs = "--enable-wayland-ime=true --wayland-text-input-version=3";
        }
      );
    };
  };
}
