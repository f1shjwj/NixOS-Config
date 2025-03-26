{
  users = {
    groups.f1shjwj.gid = 1000;
    users.f1shjwj = {
      isNormalUser = true;
      group = "f1shjwj";
      extraGroups = [
        "users"
        "wheel"
        "input"
        "i2c"
      ];
      shell = "/run/current-system/sw/bin/bash";
      hashedPasswordFile = "/etc/nixos/.password/f1shjwj";
    };
    users.root = {
      hashedPasswordFile = "/etc/nixos/.password/root";
    };
  };
}
