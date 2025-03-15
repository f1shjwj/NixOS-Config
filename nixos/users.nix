{
  users = {
    groups.cmdjwj.gid = 1000;
    users.cmdjwj = {
      isNormalUser = true;
      group = "cmdjwj";
      extraGroups = [
        "users"
        "wheel"
        "i2c"
      ];
      shell = "/run/current-system/sw/bin/bash";
      hashedPasswordFile = "/etc/nixos/nixos/password/cmdjwj";
    };
    users.root = {
      hashedPasswordFile = "/etc/nixos/nixos/password/root";
    };
  };
}
