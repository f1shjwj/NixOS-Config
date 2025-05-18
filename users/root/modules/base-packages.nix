{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    fd
    tree
    zip
    unzip
    rar
    unrar
    zlib
    killall
  ];
}
