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

  home-manager.users.${username} = { config, ... }: {
    gtk = {
      gtk2.extraConfig = ''gtk-im-module="fcitx"'';
      gtk3.extraConfig.gtk-im-module = "fcitx";
      gtk4.extraConfig.gtk-im-module = "fcitx";
    };

    # fcitx5 用 safeSave（临时文件 + rename）写配置，所以只能链目录，不能链单文件
    home.file.".config/fcitx5" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS-Config/users/f1shjwj/modules/desktop/fcitx5/configs";
    };
  };

  users.users.${username}.packages = [ fcitx5-vinput ];
}
