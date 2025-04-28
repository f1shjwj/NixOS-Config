{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = inputs;
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };
}
