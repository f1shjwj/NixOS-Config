{
  username,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  users.users.${username}.packages =
    (with pkgs; [
      # 开发
      # beekeeper-studio

      # 生产力
      obsidian

      # 社交
      follow
      telegram-desktop
      feishu

      # 通用
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
    ])
    ++ (with pkgs-unstable; [
      cherry-studio
    ]);
}
