{
  username,
  pkgs,
  inputs,
  ...
}:
{
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # nixpkgs.overlays = [ inputs.prismlauncher-cracked.overlays.default ];

  nixpkgs.overlays = [
    # 补 nixpkgs 26.05 移除的 extra-cmake-modules 别名
    (final: prev: {
      extra-cmake-modules = final.kdePackages.extra-cmake-modules;
    })
    inputs.prismlauncher-cracked.overlays.default
    # cmake 4.x no longer bundles pkg-config; prismlauncher-cracked doesn't declare it.
    (final: prev: {
      prismlauncher-unwrapped = prev.prismlauncher-unwrapped.overrideAttrs (old: {
        nativeBuildInputs = old.nativeBuildInputs ++ [ final.pkg-config ];
      });
    })
  ];

  users.users.${username}.packages = with pkgs; [
    # lutris
    techmino
    prismlauncher
    jdk25
  ];
}
