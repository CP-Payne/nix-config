{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.desktop.hyprland;
in {
  options = {
    desktop.hyprland.enable = lib.mkEnableOption "Enable hyprland compositor";

    # declare a session command so other modules (like greetd) can read it
    desktop.session.cmd = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Command to start the selected desktop session.";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    # Define waybar and other integrations in separate files and enable here

    # Tell the login manager how to start this desktop
    desktop.session.cmd = "${pkgs.dbus}/bin/dbus-run-session Hyprland";
  };
}
