{ username, ... }:
{
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };

  users.groups.video.members = [ username ];
}
