{
  services.hypridle.enable = true;

  services.hypridle.settings = {
    general = {
      lock_cmd = "pidof hyprlock || hyprlock";
      # on_lock_cmd = "loginctl lock-session";
    };
    listener = [
      {
        timeout = 600;
        on-timeout = "pidof hyprlock || hyprlock";
      }
      {
        timeout = 1800;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on";
      }
    ];
  };
}
