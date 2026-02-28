{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Use same nixpkgs defined above
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.quickshell.follows = "quickshell";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    vars = import ./vars.nix;
    lib = nixpkgs.lib;

    mkHost = {
      hostname,
      device,
      role,
      modules ? [],
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit vars;
          inherit inputs;
          inherit pkgs-unstable;
        };
        modules =
          [
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
            }
            ({...}: {networking.hostName = hostname;})
            (./devices + "/${device}.nix")
            (./roles + "/${role}.nix")
          ]
          ++ modules;
      };

    hostDefinitions = {
      laptop = {
        device = "laptop";
        role = "personal";
        modules = [./hosts/laptop];
      };
      vm-play = {
        device = "virtualbox";
        role = "personal";
        modules = [./hosts/virtualbox];
      };
      # Example combos you can enable once those host dirs exist:
      # desktop = { device = "desktop-no-wifi"; role = "minimal"; modules = [ ./hosts/desktop ]; };
      # vm-lab = { device = "virtualbox"; role = "web-hacking"; modules = [ ./hosts/vm-lab ]; };
    };
  in {
    nixosConfigurations = lib.mapAttrs (
      hostname: cfg:
        mkHost (
          {
            inherit hostname;
          }
          // cfg
        )
    ) hostDefinitions;
  };
}
