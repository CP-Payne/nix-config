{ lib, pkgs, vars, ... }:
{
	fonts.packages = with pkgs; [
		nerd-fonts
	];
}
