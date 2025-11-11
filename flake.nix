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
    vicinae.url = "github:vicinaehq/vicinae";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    prismlauncher-cracked = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
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
      };
      specialArgs = { inherit inputs pkgs-unstable; };
      nix-settings = [
        {
          nix.settings = {
            substituters = [
              "https://mirrors.ustc.edu.cn/nix-channels/store"
              "https://nix-community.cachix.org"
              "https://vicinae.cachix.org"
            ];
            trusted-public-keys = [
              "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
              "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
            ];
          };
        }
      ];
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
            nix-settings
            ++ home-manager-module
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
