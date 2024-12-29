{ config, pkgs, ... }:

{
  security.sudo.wheelNeedsPassword = false;
  users.users.jfinlays = {
    isNormalUser = true;
    description = "jfinlays";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ git ];
  };
}