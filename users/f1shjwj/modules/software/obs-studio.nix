{ username, pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    package = (
      pkgs.obs-studio.overrideAttrs (
        _finalAttrs: _prevAttrs: {
          patches = _prevAttrs.patches ++ [
            ./Fix-virtual-camera-start-failure.patch
          ];
        }
      )
    );
  };

  users.groups.video.members = [ username ];
}
