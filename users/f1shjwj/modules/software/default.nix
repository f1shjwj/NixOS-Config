{
  username,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  users.users.${username}.packages =
    (
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
        ffmpeg
        pandoc
        imagemagick
      ]
      ++ [
        (vscode.override {
          commandLineArgs = "--enable-wayland-ime=true --wayland-text-input-version=3";
        }).fhs
        (code-cursor.override {
          commandLineArgs = "--enable-wayland-ime=true --wayland-text-input-version=3";
        })
        gnumake
        nixfmt-rfc-style
        nixd
        nix-search-tv
        cachix
        # beekeeper-studio
      ]
      ++ [
        firefox
        mpv
        feh
        telegram-desktop
        obsidian
        foliate
        keepassxc
        follow
        qbittorrent
        xfce.mousepad
        wpsoffice-cn
        mission-center
        gimp3
        netease-cloud-music-gtk
        rustdesk
        peazip
        feishu
        resilio-sync
        # ventoy
      ]
      ++ [
        techmino
        hmcl
      ]
    )
    ++ (with pkgs-unstable; [
      chatbox
      gemini-cli
    ]);

  # https://nixos.wiki/wiki/Appimage
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

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
    git = {
      enable = true;
      userName = "F1shjwj";
      userEmail = "jwjawa@outlook.com";
    };
    lazygit = {
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
