{
  imports = [ ./modules/base-packages.nix ];

  environment.variables.EDITOR = "vim";

  users.users.root = {
    hashedPasswordFile = "/etc/nixos/.passwd/root";
  };
}
