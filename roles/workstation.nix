{ vars, pkgs, ... }:
{

	imports = [

		# Import only one desktop
		../desktop/niri.nix
		
		# System

		../system/nix.nix
		../system/boot.nix
		../system/fonts.nix
		../system/user.nix

		# Features (system wide installs/services/shells)
		../features/apps # folder -> default.nix
		#../features/services
		../features/shell

		# home-manager (user space)
		../home/users/default.nix
	];

	system.stateVersion = vars.stateVersion;
	
	time.timeZone = "Africa/Johannesburg";	
	i18n.defaultLocale = "en_ZA.UTF-8";
	
	# Console before GUI starts
	console = {
		font = "Lat2-Terminus16";
		keyMap = "us";
		#useXkbConfig = true;
	};



	environment.systemPackages = with pkgs; [
		git
		vim
		wget
		tree
	];


	desktop.niri.enable = true;
	features.shell.zsh.enable = true;
	features.apps.alacritty.enable = true;
	features.apps.browsers.firefox.enable = true;
	features.apps.editors.neovim.enable = true;


}
