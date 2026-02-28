{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.desktop.niri;
  isSelected = config.desktop.session.type == "niri";
in {
  options.desktop.niri.enable = lib.mkEnableOption "Enable Niri compositor";

  config = lib.mkIf (cfg.enable || isSelected) {
    programs.niri.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };

    security.polkit.enable = true;

    desktop.session.cmd = lib.mkDefault "${pkgs.dbus}/bin/dbus-run-session niri-session";
  };
}
