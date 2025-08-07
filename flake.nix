{
  description = "Single-machine NixOS config without clan-core";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-25.05";
    };
    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };



  };

  outputs = inputs@{ self, nixpkgs, flake-parts, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ system ];

      flake.nixosConfigurations.rudibox = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          assets = ./assets;
        };
        modules = [
          ./configuration.nix

          # basic system settings
          ({ pkgs, ... }: {
            nix.settings.experimental-features = [ "flakes" "nix-command" ];
            nix.settings.trusted-users = [ "rudi" ];
            documentation.nixos.enable = true;
          })

          # home manager
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.rudi = import ./homes/rudi/rudi.nix;
          }
        ];
      };
    };
}

