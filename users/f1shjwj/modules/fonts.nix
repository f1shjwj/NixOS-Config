{ pkgs, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.chinese-fonts-overlay.overlays.default ];

  fonts.fontDir.enable = true;

  fonts.packages =
    with pkgs;
    [ nerd-fonts.hack ]
    ++ [
      dejavu_fonts
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
    ];
    sansSerif = [
      "Source Han Sans SC"
      "Source Han Sans TC"
    ];
    monospace = [
      "Hack Nerd Font"
    ];
    emoji = [ "Noto Color Emoji" ];
  };
}
