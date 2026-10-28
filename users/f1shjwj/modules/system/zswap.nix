{ ... }:
{
  # 终末地吃内存，为它的性能需要调优
  boot.kernelParams = [
    "zswap.enabled=1"
    "zswap.max_pool_percent=25"
    "zswap.compressor=zstd"
  ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 100;
    "vm.min_free_kbytes" = 131072;
  };
}
