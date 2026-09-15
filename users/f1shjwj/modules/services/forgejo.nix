{
  services.forgejo = {
    enable = true;
    settings = {
      server = {
        DOMAIN = "localhost";
        ROOT_URL = "http://localhost:3000/";
        HTTP_ADDR = "127.0.0.1"; # 只听本机回环
        HTTP_PORT = 3000;
      };
      # 首次启动先开着注册：第一个注册账号自动成为管理员。
      # 建完账号后取消下一行注释再 switch 一次：
      service.DISABLE_REGISTRATION = true;
    };
    # TODO: 等待进一步配置
  };
}
