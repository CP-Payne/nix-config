{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.features.apps.browsers.firefox;
in {
  options.features.apps.browsers.firefox.enable = lib.mkEnableOption "Install Firefox system wide";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.firefox];
  };
}
