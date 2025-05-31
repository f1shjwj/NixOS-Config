{ username, ... }:
{
  users.groups.vboxusers.members = [ username ];

  virtualisation.virtualbox.host.enable = true;

  boot.blacklistedKernelModules = [
    "kvm"
    "kvm_amd"
  ];
}
