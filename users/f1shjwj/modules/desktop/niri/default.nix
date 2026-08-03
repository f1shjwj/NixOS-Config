{ username, pkgs, ... }:
{
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri.overrideAttrs (old: {
    # v5 = niri PR #1791 (wrvsrx, support-shm-sharing) 截至 2026-08-03 的状态,
    # 在 v4 基础上含 PurpleCloudX 的 3 个修复(fixate 非最终 modifier / SHM 布局校验 / 完整 chunk 上报)
    patches = old.patches ++ [ ./tag_support-shm-sharing_5.patch ];
  });

  users.users.${username}.packages = with pkgs; [
    xwayland-satellite
  ];

  home-manager.users.${username} = {
    home.file.".config/niri" = {
      source = ./configs;
      recursive = true;
    };
  };
}
