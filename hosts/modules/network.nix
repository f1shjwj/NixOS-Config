{
  networking.networkmanager.enable = true;

  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ ];

  # BBR 拥塞控制 + TCP 调优 — 对高丢包/高延迟国际线路有质的提升
  boot.kernelModules = [ "tcp_bbr" ];
  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";
    # TCP Fast Open — 省 1 RTT 握手
    "net.ipv4.tcp_fastopen" = 3;
    # 空闲后不重置拥塞窗口 — 代理长连接复用关键
    "net.ipv4.tcp_slow_start_after_idle" = 0;
    # MTU 探测 — 避免国际链路 PMTUD 黑洞
    "net.ipv4.tcp_mtu_probing" = 1;
    # BBR 需要充足缓冲填满 BDP
    "net.core.rmem_max" = 16777216;
    "net.core.wmem_max" = 16777216;
    "net.ipv4.tcp_wmem" = "4096 65536 16777216";
  };
}
