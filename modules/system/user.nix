{ lib, pkgs, vars, ... }:

{
	# Don't forget to set password with 'passwd'.
	users.users.${vars.username} = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" ];
		description = vars.fullName;
		shell = pkgs.zsh;
	};
	programs.zsh.enable = true;
}
