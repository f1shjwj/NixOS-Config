{ username, ... }:
{
  home-manager.users.${username}.programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        source = ./nix.png;
        width = 20;
        type = "iterm";
      };
      modules = [
        "title"
        "break"

        "os"
        "kernel"
        "uptime"
        "packages"
        "wm"
        "shell"
        "terminal"
        "terminalfont"
        "break"

        "host"
        "cpu"
        "gpu"
        "display"
        "memory"
        "disk"
        "battery"
        "localip"
        "break"
        "colors"
      ];
    };
  };
}
