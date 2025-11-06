{ pkgs, vars,  ... }:
{
	# Note: No need to set home.username/directory, it defaults to user account

	home.packages = with pkgs; [
		ripgrep fd
	];
	

	programs.git = {
		enable = true;
		userName = vars.fullName;
		userEmail = vars.email;
	};

	# Universal Configurations for all profiles, such as config files, etc
}
