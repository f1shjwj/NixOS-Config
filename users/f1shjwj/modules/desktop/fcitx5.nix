{ pkgs, username, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        # fcitx5-rime
        fcitx5-chinese-addons
        fcitx5-gtk
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
