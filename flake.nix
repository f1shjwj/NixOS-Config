{
  description = "F1shjwj's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # 临时：keepassxc 固定在 2.7.12 所用的 nixpkgs（gen 1620 那版）。
    # 2.8.0 在本机 Argon2 派生不稳定，会随机写坏 KDBX4 库，见 temp/keepassxc-pin.nix
    nixpkgs-old.url = "github:NixOS/nixpkgs/31ecbaca1bdefa45dffc409f0250bd8039ea0010";
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
    xyenon-nur.url = "github:XYenon/nur-packages"; # magpie
    llm-agents.url = "github:numtide/llm-agents.nix";
    deepseek-harness.url = "github:moraxyc/deepseek-harness.nix/bbb7168aff1aeafee162ab5ecde3c9c92afe0240";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    prismlauncher-cracked = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fcitx5-vinput.url = "github:xifan2333/fcitx5-vinput/v2.3.8";
    tg2qq = {
      url = "git+file:///home/f1shjwj/Codespace/tg2qq?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
              "https://deepseek-harness-nix.cachix.org"
              "https://nur-xyenon.cachix.org" # xyenon-nur
            ];
            trusted-public-keys = [
              "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
              "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
              "fcitx5-vinput.cachix.org-1:XpX3AA6+dDIX4qJhb1QM7sbTwX6/qSlGvW8Z5NK6XdU="
              "deepseek-harness-nix.cachix.org-1:5NrkwLN9veNMhiINtU5ZeV4isXFhFsOwn6Ms7J1M+TA="
              "nur-xyenon.cachix.org-1:fZ3SGJ3E1p34JSG5j4etfF9+vjJGMZxe1dDBNliKx5U="
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
