{ pkgs, ... }:
{
  fonts.fontDir = {
    enable = true;
    decompressFonts = true;
  };

  fonts.enableDefaultPackages = true;

  fonts.packages =
    with pkgs;
    [
      nerd-fonts.hack
      nerd-fonts.symbols-only
    ]
    ++ [
      source-sans
      source-serif
      source-han-sans
      source-han-serif
    ]
    ++ [
      font-awesome_6
      noto-fonts-emoji
    ];

  fonts.fontconfig.defaultFonts = {
    serif = [
      "Source Han Serif SC"
      "Source Han Serif TC"
      "Symbols Nerd Font"
    ];
    sansSerif = [
      "Source Han Sans SC"
      "Source Han Sans TC"
      "Symbols Nerd Font"
    ];
    monospace = [ "Hack Nerd Font" ];
    emoji = [ "Noto Color Emoji" ];
  };
}
