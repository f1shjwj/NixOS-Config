{ username, config, ... }:
{
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };

  users.groups.video.members = [ username ];

  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=10 card_label="OBS Virtual Camera" exclusive_caps=1
  '';
}
