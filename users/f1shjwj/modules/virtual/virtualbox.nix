{ username, ... }:
{
  users.groups.vboxusers.members = [ username ];

  virtualisation.virtualbox.host.enable = true;
}
