{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.features.apps.alacritty;
in {
  options.features.apps.alacritty.enable = lib.mkEnableOption "Install Alacritty system-wide";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.alacritty];
  };
}
