{ username, pkgs, ... }:
{
  users.users.${username}.packages = [ pkgs.devenv ];

  home-manager.users.${username}.programs = {
    # devenv 原生 auto-activation（devenv hook，替代 direnv）
    bash.initExtra = ''
      eval "$(${pkgs.devenv}/bin/devenv hook bash)"
    '';
    fish.interactiveShellInit = ''
      ${pkgs.devenv}/bin/devenv hook fish | source
    '';
  };
}
