{ inputs, pkgs, ... }:
{
  imports = [ inputs.deepseek-harness.nixosModules.default ];

  programs.dsh = {
    enable = true;
    package = inputs.deepseek-harness.packages.${pkgs.system}.dsh;

    desktop = {
      enable = true;
      package = inputs.deepseek-harness.packages.${pkgs.system}.dsh-desktop-official;
    };
  };
}
