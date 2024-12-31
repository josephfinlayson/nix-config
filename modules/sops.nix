{...}:

{
  sops = {
    defaultSopsFile = ../secrets/core.yaml;
    age = {
      sshKeyPaths = [ "/home/jfinlays/.ssh/id_ed25519" ];
    };
    secrets = {
      default_password = {
        neededForUsers = true;
      };
    };
  };
}
