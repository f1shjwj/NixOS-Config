{
  imports = [
    ./hardware-configuration.nix
    ./modules.nix
  ];

  networking.hostName = "F1shjwj-Code01";

  nix.settings.trusted-users = [
    "root"
    "f1shjwj"
  ];

  system.stateVersion = "25.05";
}
