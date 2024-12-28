{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    vscode 
    nixpkgs-fmt
    gnupg
    neovim
    nmap
    gparted
    git
    syslinux
    nil
  ];
}