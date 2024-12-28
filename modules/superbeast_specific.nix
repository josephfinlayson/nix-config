{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.extraEntries."ubuntu.conf" = ''
    title Ubuntu 23.04
    efi   /efi/ubuntu/shimx64.efi
  '';
}