{ username, pkgs, ... }:
{
  home-manager.users.${username}.programs = {
    bash.enable = true;
    bash.initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]; then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';

    fish.enable = true;
    fish.interactiveShellInit = ''
      set -g fish_greeting "Welcome, F1shjwj! Time is $(date +%H:%M)"
    '';
    fish.shellAliases = {
      qqf = "flatpak run com.qq.QQ --enable-wayland-ime --wayland-text-input-version=3";
      lazypodman = "DOCKER_HOST=unix:///run/user/$(id -u)/podman/podman.sock lazydocker";
    };
    nushell.enable = true;
  };
}
