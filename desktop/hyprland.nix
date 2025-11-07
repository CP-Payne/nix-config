{ lib, config, pkgs, ... }:
	let cfg = config.desktop.hyprland;
	in {
		options.desktop.hyprland.enable = lib.mkEnableOption "Enable hyprland compositor";

		config = lib.mkIf cfg.enable {
			programs.hyprland.enable = true;

			xdg.portal.enable = true;
			xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
			# Define waybar and other integrations in separate files and enable here

		};
}
