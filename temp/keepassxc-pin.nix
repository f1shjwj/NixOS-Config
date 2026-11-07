# 临时把 keepassxc 固定在 2.7.12，不要随手删。
#
# 原因（2026-11-07 实测，本机 F1shjwj-Code01 / keepassxc 2.8.0）：
#   - KDBX4 + Argon2 库，用正确密码解锁 180 次里有 25 次报 HMAC 不匹配
#   - 保存 60 次里有 3 次写出密钥错误的文件，该文件之后任何密码都打不开
#   - 同样文件交给 2.7.12：解锁 180 次全过，保存 40 轮全过
#   - KDBX3.1 + AES-KDF 的库不受影响，所以问题在 Argon2 这条路径
# 结果：一个 210 KB 的库在 11-07 08:11:27 被 2.8.0 写坏，无法恢复。
#
# 上游修好之后，把 flake.nix 里的 nixpkgs-old 和这个文件一起删掉即可。
{ inputs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      keepassxc = inputs.nixpkgs-old.legacyPackages.${prev.stdenv.hostPlatform.system}.keepassxc;
    })
  ];
}
