{ pkgs, lib, vars, ... }:
{
	time.timeZone = "Africa/Johannesburg";	

	i18n.defaultLocale = "en_ZA.UTF-8";
	
	# Console before GUI starts
	console = {
		font = "Lat2-Terminus16";
		keyMap = "us";
		#useXkbConfig = true;
	};


	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.efi.efiSysMountPoint = "/boot";

	system.stateVersion = vars.stateVersion;
	nix.settings.experimental-features = ["nix-command" "flakes" ];

	environment.systemPackages = with pkgs; [
		git
		vim
		wget
		tree
	];
}
