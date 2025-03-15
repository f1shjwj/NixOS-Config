{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    mpv
    clash-verge-rev
    vscodium
    telegram-desktop
    obsidian
    libreoffice
    techmino
    steam
  ];

  # programs.vscode = {
  #   enable = true;
  #   package = pkgs.vscodium;
  #   extensions = with pkgs.vscode-extensions; [
  #     ms-ceintl.vscode-language-pack-zh-hans
  #     continue.continue
  #     intellsmi.comment-translate
  #     # renping.deepseek-comment-translate
  #     jnoortheen.nix-ide
  #   ];
  #   # userSettings = {
  #   #   "editor.fontFamily" = "'monospace', monospace";
  #   #   "editor.fontSize" = 16;
  #   # };
  # };
}
