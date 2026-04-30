{ username, pkgs, ... }:
{
  programs.dconf.enable = true;

  services.gvfs.enable = true;
  services.gnome.sushi.enable = true;

  users.users.${username}.packages = with pkgs; [
    nautilus
    file-roller
    loupe
    gnome-disk-utility
    gnome-text-editor
  ];
}
