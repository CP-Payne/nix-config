{ lib, config, pkgs, ... }:
lib.mkIf config.profile.desktop.niri.enable {
	home.packages = with pkgs; [ niri ];
	# xdg.configFile."niri/config.kdl".source = ../../../.dotfiles/niri/config.kdl
}
