{ config, pkgs, ... }:

{

  programs.usbtop.enable = true;
  
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
    fluxcd
    # kubernetes-helm
    kompose
    k9s
    kubectl
    sops
    kustomize
    cloudflared
    nixos-anywhere
    xclip
    # nixos-generators

  ];


}
