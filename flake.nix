{
  description = "cmdjwj's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flatpaks.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
    # nur = {
    #   url = "github:nix-community/NUR";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      flatpaks,
      ...
    }@inputs:
    {
      nixosConfigurations.jwj-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = inputs;
              useGlobalPkgs = true;
              useUserPackages = true;
              users.cmdjwj.imports = [
                ./home
                flatpaks.homeManagerModules.nix-flatpak
              ];
            };
          }
        ];
      };
    };
}
