{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.desktop.xfce;
  isSelected = config.desktop.session.type == "xfce";
  xfceSession = "${pkgs.xfce.xfce4-session}/bin/startxfce4";
  xfceSessionWithVBoxClient = "${pkgs.bash}/bin/bash -lc '${pkgs.virtualboxGuestAdditions}/bin/VBoxClient-all & exec ${xfceSession}'";
in {
  options.desktop.xfce.enable = lib.mkEnableOption "Enable XFCE desktop";

  config = lib.mkIf (cfg.enable || isSelected) {
    services.xserver.enable = true;
    services.xserver.libinput.enable = true;
    services.xserver.desktopManager.xfce.enable = true;

    environment.systemPackages = [
      pkgs.xorg.xinit
    ];

    desktop.session.cmd = lib.mkDefault "${pkgs.dbus}/bin/dbus-run-session ${if config.virtualisation.virtualbox.guest.enable then xfceSessionWithVBoxClient else xfceSession}";
  };
}
