{
  services.greetd = {
    enable = true;
  };
  programs.regreet = {
    enable = true;
    cageArgs = [
      "-s"
      "-mlast"
    ];
  };
}
