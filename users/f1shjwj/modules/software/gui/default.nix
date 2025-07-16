{
  username,
  pkgs,
  pkgs-unstable,
  ...
}:
let
  # 开发
  dev = with pkgs; [
    (vscode.override {
      commandLineArgs = "--enable-wayland-ime=true --wayland-text-input-version=3";
    }).fhs
    (code-cursor.override {
      commandLineArgs = "--enable-wayland-ime=true --wayland-text-input-version=3";
    })
    # beekeeper-studio
  ];

  # 生产力
  productivity =
    (with pkgs; [
      obsidian
    ])
    ++ (with pkgs-unstable; [
      chatbox
    ]);

  # 社交
  social = with pkgs; [
    follow
    telegram-desktop
    feishu
  ];

  # 通用
  general = with pkgs; [
    mpv
    feh
    foliate
    keepassxc
    qbittorrent
    xfce.mousepad
    mission-center
    gimp3
    rustdesk
    peazip
    resilio-sync
    # ventoy
  ];

in
{
  users.users.${username}.packages = (dev ++ productivity ++ social ++ general);
}
