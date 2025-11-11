{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings.max-jobs = 2;
}
