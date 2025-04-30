{
  description = "F1shjwj's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
    chinese-fonts-overlay.url = "github:brsvh/chinese-fonts-overlay/main";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        "F1shjwj-Code01" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules =
            [ ./plugin ]
            ++ [
              ./hosts/Code01
              ./users/root
              ./users/f1shjwj
            ];
        };
      };
    };
}
