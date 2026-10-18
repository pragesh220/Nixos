{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    php
    phpPackages.composer
    sqlite
    gcc 
    gnumake 
    cmake 
    gdb
    python3 
    rustc
    cargo
    rust-analyzer
    rustfmt
    clippy
    zed-editor

  ];
}
