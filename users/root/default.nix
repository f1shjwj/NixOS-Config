{
  imports = [ ../../modules/base-packages.nix ];

  users.users.root = {
    hashedPasswordFile = "/etc/nixos/.passwd/root";
  };
}
