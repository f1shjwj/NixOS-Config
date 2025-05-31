{
  description = "F1shjwj's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
    chinese-fonts-overlay.url = "github:brsvh/chinese-fonts-overlay/main";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
        config.permittedInsecurePackages = [
          "clash-verge-rev-2.2.3"
          "clash-verge-rev-webui-2.2.3"
          "clash-verge-rev-service-2.2.3"
          "clash-verge-rev-unwrapped-2.2.3"
        ];
      };
      specialArgs = { inherit inputs pkgs-unstable; };
      home-manager-module = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = specialArgs;
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
          };
        }
      ];
      nur-module = [ inputs.nur.modules.nixos.default ];
    in
    {
      nixosConfigurations = {
        "F1shjwj-Code01" = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          specialArgs = specialArgs;
          modules =
            home-manager-module
            ++ nur-module
            ++ [ ./hosts/Code01 ]
            ++ [
              ./users/root
              ./users/f1shjwj
            ];
        };
      };
    };
}
