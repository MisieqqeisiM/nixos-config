let
  system = "x86_64-linux";
  description = "My system config";
  user = "suspicious_goo";
in {
  inherit description;

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./nixos/configuration.nix
      ];
    };

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      modules = [
        ./home/configuration.nix
      ];
      pkgs = nixpkgs.legacyPackages.${system};
    };
  };
}
