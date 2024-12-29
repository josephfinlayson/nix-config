{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vscode 
    nixpkgs-fmt
    gnupg
    neovim
    nmap
    git
    syslinux
    gh
    home-manager
    nil
  ];
}