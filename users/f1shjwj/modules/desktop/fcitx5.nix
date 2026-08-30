{
  pkgs,
  username,
  inputs,
  ...
}:
let
  fcitx5-vinput = inputs.fcitx5-vinput.packages."${pkgs.stdenv.hostPlatform.system}".default;
in
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = [
        pkgs.fcitx5-rime
        pkgs.fcitx5-gtk
        fcitx5-vinput
      ];
    };
  };

  # environment.sessionVariables = {
  #   QT_IM_MODULE = "fcitx";
  # };

  home-manager.users.${username}.gtk = {
    gtk2.extraConfig = ''gtk-im-module="fcitx"'';
    gtk3.extraConfig.gtk-im-module = "fcitx";
    gtk4.extraConfig.gtk-im-module = "fcitx";
  };

  users.users.${username}.packages = [ fcitx5-vinput ];
}
