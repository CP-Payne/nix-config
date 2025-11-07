{ lib, config, pkgs, ... }:
let cfg = config.desktop.niri;
	in {
		options.desktop.niri.enable = lib.mkEnableOption "Enable Niri compositor";

		config = lib.mkIf cfg.enable {
			programs.niri.enable = true;

			xdg.portal.enable = true;
			xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
			# environment.systemPackages = with pkgs; [niri xdg-desktop-portal-wlr ];
			# Define waybar and other integrations in separate files and enable here

		};
}
