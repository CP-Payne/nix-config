{ lib, config, pkgs, ... }:
let 
cfg = config.desktop.niri;
in {
	options = {

		desktop.niri.enable = lib.mkEnableOption "Enable Niri compositor";


		# declare a session command so other modules (like greetd) can read it
		desktop.session.cmd = lib.mkOption {
			type = lib.types.str;
			default = "";
			description = "Command to start the selected desktop session.";
		};
	};

	config = lib.mkIf cfg.enable {
		programs.niri.enable = true;

		xdg.portal.enable = true;
		xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
		# environment.systemPackages = with pkgs; [niri xdg-desktop-portal-wlr ];
		# Define waybar and other integrations in separate files and enable here
		# Tell the login manager how to start this desktop
		#_module.args.desktopSessionCmd = "${pkgs.dbus}/bin/dbus-run-session niri";
		desktop.session.cmd = "${pkgs.dbus}/bin/dbus-run-session niri";

	};
}
