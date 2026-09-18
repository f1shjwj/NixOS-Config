{
  description = "F1shjwj's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    llm-agents.url = "github:numtide/llm-agents.nix";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    prismlauncher-cracked = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fcitx5-vinput.url = "github:xifan2333/fcitx5-vinput/v2.3.8";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    let
      specialArgs = { inherit inputs; };
      nix-settings = [
        {
          # nixpkgs.config.permittedInsecurePackages = [ "electron-40.10.5" ];
          nixpkgs.config.allowUnfree = true;
          nix.settings = {
            substituters = [
              "https://mirrors.ustc.edu.cn/nix-channels/store"
              "https://nix-community.cachix.org"
              "https://cache.numtide.com" # llm-agents
              "https://fcitx5-vinput.cachix.org"
            ];
            trusted-public-keys = [
              "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
              "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
              "fcitx5-vinput.cachix.org-1:XpX3AA6+dDIX4qJhb1QM7sbTwX6/qSlGvW8Z5NK6XdU="
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
          specialArgs = specialArgs;
          modules =
            nix-settings
            ++ home-manager-module
            ++ nur-module
            ++ [ ./temp ]
            ++ [ ./hosts/Code01 ]
            ++ [
              ./users/root
              ./users/f1shjwj
            ];
        };
      };
    };
}
