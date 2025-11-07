{ pkgs, ... }:
{


	imports = [

		# Harware Config
		./hardware-configuration.nix
		# Roles
		../../roles/workstation.nix

		# Host specific configurations
		../../features/services/bluetooth.nix
	];


 	networking.hostName = "laptop";

	features.services.bluetooth.enable = false;




}
