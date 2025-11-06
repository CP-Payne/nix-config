{
	description = "My first flake!";
	
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		home-manager.url = "github:nix-community/home-manager/release-25.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Use same nixpkgs defined above
	};

	outputs = {self, nixpkgs, home-manager, ...}:
  let 
	system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
	vars = import ./vars.nix;
	
  in {
    nixosConfigurations = {
      # usually start with host name
      vm = nixpkgs.lib.nixosSystem {
	specialArgs = {
		inherit home-manager vars;
	};
	#modules = [ ./configuration.nix ];
	modules = [ ./hosts/vm/configuration.nix ];
      }; 
    };
  };
}
