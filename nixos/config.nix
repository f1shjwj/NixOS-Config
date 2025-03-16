{
  services = {
    flatpak.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    kmscon = {
      enable = true;
      hwRender = true;
      extraConfig = "font-size=14";
    };
  };

  programs = {
    hyprland.enable = true;
  };
}
