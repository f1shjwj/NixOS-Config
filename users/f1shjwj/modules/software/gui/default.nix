{
  username,
  pkgs,
  ...
}:
{
  users.users.${username}.packages = with pkgs; [
    # 开发
    # beekeeper-studio

    # 生产力
    obsidian

    # 社交
    # follow
    telegram-desktop
    # feishu

    # 通用
    mpv
    feh
    foliate
    keepassxc
    qbittorrent
    mission-center
    # gimp3
    # rustdesk
    # resilio-sync
    # ventoy
    zotero

    drawio

    cherry-studio
  ];
}
