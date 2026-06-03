{
  nixpkgs.overlays = [
    (final: prev: {
      swaylock-effects = prev.symlinkJoin {
        name = "swaylock-effects";
        paths = [ prev.swaylock-effects ];
        postBuild = ''
          rm $out/bin/swaylock
          cat > $out/bin/swaylock << 'SCRIPT'
          #!${prev.bash}/bin/sh
          export LC_TIME=C.UTF-8
          if ${prev.procps}/bin/pgrep -x swaylock | grep -qv $$; then
            exit 0
          fi
          exec ${prev.swaylock-effects}/bin/swaylock "$@"
          SCRIPT
          chmod +x $out/bin/swaylock
        '';
      };
    })
  ];
}
