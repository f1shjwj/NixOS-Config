{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [
    firefox
  ];

  home-manager.users.${username}.programs = {
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
