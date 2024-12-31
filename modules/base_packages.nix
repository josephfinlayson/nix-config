{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vscode
    nixpkgs-fmt
    gnupg
    neovim
    age
    nmap
    git
    syslinux
    gh
    home-manager
    nil
    k9s
  ];
}
