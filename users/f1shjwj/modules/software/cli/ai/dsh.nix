{ inputs, pkgs, ... }:
let
  dshPackages = inputs.deepseek-harness.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [ inputs.deepseek-harness.nixosModules.default ];

  programs.dsh = {
    enable = true;
    package = dshPackages.dsh;

    desktop = {
      enable = true;
      package = dshPackages.dsh-desktop-official;
    };
  };
}
