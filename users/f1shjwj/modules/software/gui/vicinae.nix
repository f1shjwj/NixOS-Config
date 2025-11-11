{ username, inputs, ... }:
{
  # https://docs.vicinae.com/nixos
  nix.settings = {
    substituters = [
      "https://vicinae.cachix.org"
    ];
    trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };

  home-manager.users.${username} = {
    imports = [ inputs.vicinae.homeManagerModules.default ];
    services.vicinae = {
      enable = true;
      autoStart = true;
    };
  };
}
