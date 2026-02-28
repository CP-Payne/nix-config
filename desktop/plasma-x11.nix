{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.desktop.plasmaX11;
  isSelected = config.desktop.session.type == "plasma-x11";
in {
  options.desktop.plasmaX11.enable = lib.mkEnableOption "Enable KDE Plasma desktop on X11";

  config = lib.mkIf (cfg.enable || isSelected) {
    services.xserver.enable = true;
    services.xserver.libinput.enable = true;
    services.desktopManager.plasma6.enable = true;

    environment.systemPackages = [
      pkgs.xorg.xinit
    ];

    desktop.session.cmd = lib.mkDefault "${pkgs.dbus}/bin/dbus-run-session ${pkgs.kdePackages.plasma-workspace}/bin/startplasma-x11";
  };
}
