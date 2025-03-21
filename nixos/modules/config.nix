{
  services = {
    flatpak.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
      };
    };
  };

  programs = {
    hyprland.enable = true;
  };
}
