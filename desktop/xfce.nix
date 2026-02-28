{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.desktop.xfce;
  isSelected = config.desktop.session.type == "xfce";
in {
  options.desktop.xfce.enable = lib.mkEnableOption "Enable XFCE desktop";

  config = lib.mkIf (cfg.enable || isSelected) {
    services.xserver.enable = true;
    services.xserver.desktopManager.xfce.enable = true;

    desktop.session.cmd = lib.mkDefault "${pkgs.dbus}/bin/dbus-run-session startxfce4";
  };
}
