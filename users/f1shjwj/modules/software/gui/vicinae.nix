{ username, inputs, ... }:
{
  # https://docs.vicinae.com/nixos
  home-manager.users.${username} = {
    imports = [ inputs.vicinae.homeManagerModules.default ];
    services.vicinae = {
      enable = true;
      systemd = {
        enable = true;
        autoStart = true;
        environment = {
          USE_LAYER_SHELL = 1;
        };
      };
    };
  };
}
