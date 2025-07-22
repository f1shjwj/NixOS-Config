{ username, pkgs, ... }:
{
  users.users.${username}.packages = [ pkgs.gtklock ];

  security.pam.services.gtklock = {
    text = ''auth include login'';
  };
}
