{
  programs.hyprlock.enable = true;

  programs.hyprlock.settings = {
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
        text = "cmd[update:1000] echo \"<b><big> $(date +'%H %M') </big></b>\"";
        font_size = 110;
        shadow_passes = 2;
        shadow_size = 1;
        position = "0, 320";
        halign = "center";
        valign = "center";
      }
      {
        monitor = "";
        text = ''cmd[update:18000000] echo "<b><big> $(date +'%Y-%m-%d %A') </big></b>"'';
        font_size = 25;
        shadow_passes = 2;
        shadow_size = 1;
        position = "0, 200";
        halign = "center";
        valign = "center";
      }
      {
        monitor = "";
        text = "cmd[update:18000000] echo \"<b>Feels like<big> $(curl -s 'wttr.in?format=%t' | tr -d '+') </big></b>\"";
        font_size = 18;
        shadow_passes = 1;
        shadow_size = 1;
        position = "0, 40";
        halign = "center";
        valign = "bottom";
      }
    ];
  };
}
