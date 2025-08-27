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

  hardware.amdgpu.amdvlk = {
    enable = true;
    support32Bit.enable = true;
  };

  nixpkgs.overlays = [ inputs.prismlauncher-cracked.overlays.default ];

  users.users.${username}.packages = with pkgs; [
    lutris
    techmino
    prismlauncher
  ];
}
