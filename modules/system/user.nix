{ lib, pkgs, vars, ... }:

{
	# Don't forget to set password with 'passwd'.
	users.users.${vars.username} = {
		isNormalUser = true;
		extraGroups = [ "Wheel" "networkmanager" ];
		description = vars.fullName;
		shell = pkgs.zsh;
	};
	programs.zsh.enable = true;
}
