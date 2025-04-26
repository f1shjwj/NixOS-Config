{
  services = {
    flatpak.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
    };
    blueman.enable = true;
  };

  security.rtkit.enable = true;

  # programs = {
  #   hyprland.enable = true;
  # };

  hardware.bluetooth.enable = true;
}
