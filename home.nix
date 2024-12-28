{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ atool httpie ];
  home.stateVersion = "24.05";
}