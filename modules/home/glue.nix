{ config, home-manager, vars, lib, ... } :

{
	imports = [ home-manager.nixosModules.home-manager ];

	home-manager.useGlobalPkgs = true;
	home-manager.useUserPackages = true;
	home-manager.backupFileExtension = "backup";

	home-manager.sharedModules = [
		../home/profile/niri.nix
		../home/apps/editor-neovim.nix
	];
	home-manager.extraSpecialArgs = { inherit vars; };
		
	home-manager.users.${vars.username} = {
		home.stateVersion = vars.stateVersion;
		programs.home-manager.enable = true;

		# Forward system flags into HomeManager

		# Pull in HM profile modules here ( base + features via `features.nix`)
		imports = [
			../home/profile/base.nix

			../features.nix

		#	../home/profile/niri.nix
	#		../home/apps/editor-neovim.nix
		];

		profile = config.profile;
	};
}
