{
  pkgs,
  pkgs-unstable,
  username,
  ...
}:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = [
        pkgs.qt6Packages.fcitx5-chinese-addons
        pkgs.fcitx5-gtk
        pkgs-unstable.fcitx5-pinyin-zhwiki
        pkgs-unstable.fcitx5-pinyin-moegirl
        pkgs-unstable.fcitx5-pinyin-minecraft
      ];
    };
  };

  environment.sessionVariables = {
    QT_IM_MODULE = "fcitx";
  };

  home-manager.users.${username}.gtk = {
    gtk2.extraConfig = ''gtk-im-module="fcitx"'';
    gtk3.extraConfig.gtk-im-module = ''fcitx'';
    gtk4.extraConfig.gtk-im-module = ''fcitx'';
  };
}
