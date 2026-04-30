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

  nixpkgs.overlays = [ inputs.prismlauncher-cracked.overlays.default ];

  users.users.${username}.packages = with pkgs; [
    # lutris
    techmino
    prismlauncher
  ];
}
