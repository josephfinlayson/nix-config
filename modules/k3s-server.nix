{
  networking.firewall.allowedTCPPorts = [
    6443 # k3s: required so that pods can reach the API server (running on port 6443 by default)
    2379 # k3s, etcd clients: required if using a "High Availability Embedded etcd" configuration
    2380 # k3s, etcd peers: required if using a "High Availability Embedded etcd" configuration
  ];
  networking.firewall.allowedUDPPorts = [
    8472 # k3s, flannel: required if using multi-node for inter-node networking
  ];

  services = {
    k3s = {
      enable = true;
      delay = 100;
      prepare = {
        cilium = true;
      };
      services = {
        kube-proxy = true;
        flux = true;
        servicelb = false;
        traefik = false;
        local-storage = false;
        metrics-server = false;
        coredns = false;
        flannel = false;
      };
      bootstrap = {
        helm = {
          enable = true;
          completedIf = "get CustomResourceDefinition -A | grep -q 'cilium.io'";
          helmfile = "/etc/k3s/helmfile.yaml";
        };
      };

    };
  };

  # Static IP configuration
  networking = {
  useDHCP = false;
    defaultGateway = "192.168.0.1";
  nameservers = [ "8.8.8.8" "8.8.4.4" ];
  interfaces.eno1 = {
    ipv4.addresses = [{
      address = "192.168.0.100";
      prefixLength = 24;
    }];
  };
  };


}