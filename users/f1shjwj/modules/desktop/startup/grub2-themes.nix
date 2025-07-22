{ inputs, ... }:
{
  # https://github.com/vinceliuice/grub2-themes
  imports = [ inputs.grub2-themes.nixosModules.default ];

  boot.loader.grub2-theme = {
    enable = true;
    theme = "stylish";
    footer = true;
    customResolution = "2560x1600";
  };
}
