{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.desktop.hyprland;
  isSelected = config.desktop.session.type == "hyprland";
in {
  options.desktop.hyprland.enable = lib.mkEnableOption "Enable Hyprland compositor";

  config = lib.mkIf (cfg.enable || isSelected) {
    programs.hyprland.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    };

    desktop.session.cmd = lib.mkDefault "${pkgs.dbus}/bin/dbus-run-session Hyprland";
  };
}
