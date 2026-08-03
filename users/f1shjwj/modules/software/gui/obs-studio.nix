{
  username,
  config,
  pkgs,
  ...
}:
{
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = [ pkgs.obs-studio-plugins.obs-pipewire-audio-capture ];
  };

  users.groups.video.members = [ username ];

  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=10 card_label="OBS Virtual Camera" exclusive_caps=1
  '';
}
