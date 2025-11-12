{
  pkgs,
  inputs,
  username,
  ...
}:
{
  users.users.${username}.packages = with pkgs; [
    inputs.noctalia.packages.${system}.default
  ];

  home-manager.users.${username} = {
    imports = [ inputs.noctalia.homeModules.default ];
    programs.noctalia-shell = {
      enable = true;
      systemd.enable = true;
    };
  };

  services.upower.enable = true;
}
