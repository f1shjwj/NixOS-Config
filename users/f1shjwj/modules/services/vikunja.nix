{ ... }:
{
  services.vikunja = {
    enable = true;
    frontendScheme = "http";
    frontendHostname = "localhost";
    # 只本机访问，不暴露到局域网。以后要给 hermes容器/手机用再改成 "" (0.0.0.0)
    address = "127.0.0.1";
    port = 3456;
    database.type = "sqlite"; # 个人单机 sqlite 最简单，备份就拷 /var/lib/vikunja/vikunja.db
    settings = {
      service = {
        enableregistration = false; # 禁止公开注册，你手动建用户
        # enableemailreminders = false;
      };
      # 本地无需 cors/mail/redis
    };
  };

  # 本地方案不需要 nginx / cloudflared / tailscale
  # 浏览器直接 http://localhost:3456 就是前端+API
  # 想用 http://localhost 去掉端口，再加 nginx proxyPass

  # desktop 2.3.0 与 server 2.5.0 不兼容，已弃用，直接用浏览器 PWA
}
