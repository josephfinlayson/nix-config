{ config, pkgs, ... }:

{

  users.mutableUsers = false;

  users.users.nixos = {
    isNormalUser = true;
    description = "nixos";
    hashedPasswordFile = config.sops.secrets.default_password.path;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = false;
  users.users.jfinlays = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.default_password.path;
    description = "jfinlays";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}