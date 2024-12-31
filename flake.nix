{
  description = "NixOS configuration";

  inputs = {
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
        pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";

  };

  outputs = { self, sops-nix, nixpkgs, home-manager, ... }@inputs:
    let
      baseModules = [
        ./modules/sops.nix
        sops-nix.nixosModules.sops
        ./modules/wifi.nix
        ./modules/1password.nix
        ./modules/base.nix
        ./modules/base_packages.nix
        ./modules/gui.nix
        ./modules/audio.nix
        ./modules/users.nix
        ./modules/locale.nix
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jfinlays.imports = [ ./home.nix ];
          # home-manager.users.nixos.imports = [ ./home.nix ];
        }
        home-manager.nixosModules.home-manager
      ];
    in {
      nixosConfigurations = {
        beast = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = baseModules ++ [
            ./machines/superbeast.nix
            ./modules/superbeast_specific.nix
          ];
        };

        minifriend = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = baseModules ++ [
            ./machines/minifriend.nix
            ./modules/k3s-server.nix
          ];
        };
      };
    };
}