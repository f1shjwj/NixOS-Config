{ pkgs, ... }:
{
  fonts.fontDir.enable = true;

  fonts.packages =
    with pkgs;
    [ (nerdfonts.override { fonts = [ "Hack" ]; }) ]
    ++ [
      source-sans
      source-serif
      source-han-sans
      source-han-serif
    ]
    ++ [
      corefonts
      windows-fonts
    ]
    ++ [
      font-awesome
      noto-fonts-emoji
    ];

  fonts.fontconfig.defaultFonts = {
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
}
