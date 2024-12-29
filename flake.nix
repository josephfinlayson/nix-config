{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.beast = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };


      system = "x86_64-linux";
      modules = [
        ./machines/superbeast.nix
        ./modules/superbeast_specific.nix
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
          home-manager.users.jfinlays = import ./home.nix;
        }
        home-manager.nixosModules.home-manager
      ];
    };
  };
}