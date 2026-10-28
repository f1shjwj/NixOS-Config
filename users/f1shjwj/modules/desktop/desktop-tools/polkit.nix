{
  security.polkit = {
    enablePkexecWrapper = true;
  };

  # polkit 用 noctalia 内置；回退开 soteria
  # security.soteria.enable = true;
}
