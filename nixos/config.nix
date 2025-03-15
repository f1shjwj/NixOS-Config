{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  services = {
    flatpak.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  programs = {
    hyprland.enable = true;
    thunar.enable = true;
    xfconf.enable = true;
  };

  # xfce.thunar-archive-plugin
  # xfce.thunar-volman

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-rime
        fcitx5-chinese-addons
      ];
    };
  };

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      font-awesome
      noto-fonts-emoji
      source-sans
      source-serif
      source-han-sans
      source-han-serif
      (nerdfonts.override {
        fonts = [
          "Hack"
        ];
      })
    ];
    fontconfig.defaultFonts = {
      serif = [
        "Source Han Serif SC"
        "Source Han Serif TC"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "Source Han Sans SC"
        "Source Han Sans TC"
        "Noto Color Emoji"
      ];
      monospace = [
        "Hack Nerd Font"
        "Noto Color Emoji"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
