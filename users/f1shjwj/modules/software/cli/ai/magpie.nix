{ username, pkgs, inputs, ... }:
{
  # From `xyenon-nur`, not `nur`: that input keeps its own nixpkgs pin, which is the one
  # nur-xyenon.cachix.org is built against. Without an override it is the GUI build,
  # also the only variant the cache carries.
  users.users.${username}.packages = [
    inputs.xyenon-nur.packages.${pkgs.stdenv.hostPlatform.system}.magpie
  ];
}
