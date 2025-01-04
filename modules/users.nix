{ config, pkgs, ... }:

{

  users.mutableUsers = false;

  users.users.nixos = {
    isNormalUser = true;
    description = "nixos";
    hashedPasswordFile = config.sops.secrets.default_password.path;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
    # change this to your ssh key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINynpSQcvMJMjB6nyIFbZtA9/HBFQ89idgKpjOrnMnYE joseph.finlayson@gmail.com"
  ];
  };

    users.users.root.openssh.authorizedKeys.keys = [
    # change this to your ssh key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINynpSQcvMJMjB6nyIFbZtA9/HBFQ89idgKpjOrnMnYE joseph.finlayson@gmail.com"
  ];

  security.sudo.wheelNeedsPassword = false;
  users.users.jfinlays = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.default_password.path;
    description = "jfinlays";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
    # change this to your ssh key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINynpSQcvMJMjB6nyIFbZtA9/HBFQ89idgKpjOrnMnYE joseph.finlayson@gmail.com"
  ];
  };
}