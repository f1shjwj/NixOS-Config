{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        ignore_empty_input = true;
      };
      background = [
        {
          monitor = "";
          path = "${./portal.png}";
        }
      ];
      input-field = [
        {
          monitor = "";
          shadow_passes = 1;
          hide_input = true;
          placeholder_text = "";
          fail_text = "";
        }
      ];
      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo $(date)";
        }
      ];
    };
  };
}
