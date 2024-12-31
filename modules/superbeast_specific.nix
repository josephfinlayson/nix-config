{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.extraEntries."ubuntu.conf" = ''
    title Ubuntu 23.04
    efi   /efi/ubuntu/shimx64.efi
  '';

# wlp9s0
networking = {
  useDHCP = false;
  interfaces.wlp9s0 = {
    ipv4.addresses = [{
      address = "192.168.0.200";
      prefixLength = 24;
    }];
  };
  defaultGateway = "192.168.0.1";
  nameservers = [ "8.8.8.8" "8.8.4.4" ];
};
}