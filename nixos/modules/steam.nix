{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    package = pkgs.steam.override {
      extraPkgs = 
      pkgs: with pkgs; [

      
      # Additional libraries for better compatibility
      libXScrnSaver
      libXcomposite
      libXdamage
      libXext


      libkrb5
      keyutils
      ];

    };
  };
}
