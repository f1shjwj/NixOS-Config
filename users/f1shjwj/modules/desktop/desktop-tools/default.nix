{ username, pkgs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    pavucontrol
    brightnessctl
    ddcutil
    playerctl

    wl-clipboard

    networkmanagerapplet
  ];

  home-manager.users.${username} = {
    services = {
      cliphist = {
        enable = true;
        # 补偿去重范围：删掉手动 wl-paste 服务后，dedupe 由 100 条降到 10 条，补回 100 保持行为一致
        extraOptions = [
          "-max-dedupe-search"
          "100"
          "-max-items"
          "500"
        ];
      };
      udiskie.enable = true;
      network-manager-applet.enable = true;
      mpris-proxy.enable = true;
    };
  };
}
