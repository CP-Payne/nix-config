{ lib, pkgs, vars, ... }:

{
	# Don't forget to set password with 'passwd'.
	users.users.${vars.username} = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
		description = vars.fullName;
		shell = pkgs.zsh; #if feature enabled
	};
	#programs.zsh.enable = true;
}
