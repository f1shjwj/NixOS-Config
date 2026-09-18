{
  security.polkit = {
    enablePkexecWrapper = true;
  };

  # polkit 认证代理改用 noctalia 内置(视觉融入 shell, 可附着 bar)
  # 已在 noctalia Settings → Shell → 常规 里打开 polkit_agent
  # 回退: 取消下行注释 + noctalia 设置里关掉 polkit agent
  # security.soteria.enable = true;
}
