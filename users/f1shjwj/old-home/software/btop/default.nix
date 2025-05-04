{
  programs.btop = {
    enable = true;
    extraConfig = builtins.readFile ./btop.conf;
  };
}
