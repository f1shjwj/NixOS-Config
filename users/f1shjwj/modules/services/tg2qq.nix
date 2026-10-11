# tg2qq + NapCat 的服务定义在项目仓库里（tg2qq/nix/module.nix），经 flake input 引入；
# 本文件只把它接进系统，不描述 tg2qq 的任何细节（部署路径、依赖、命令都在那边）。
{ inputs, ... }:
{
  imports = [ inputs.tg2qq.nixosModules.default ];
}
