{
  lib,
  config,
  pkgs,
  ...
}: let
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

    xdg.portal = {
	enable = true;
	wlr.enable = true; # backend for Niri (wlroots)
	extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # generic dialogs
    };
    security.polkit.enable = true;


    desktop.session.cmd = "Niri";
  };
}
