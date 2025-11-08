{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.features.wallpaper.mpvpaper;
in {
  options.features.wallpaper.mpvpaper.enable = lib.mkEnableOption "Install and enable pmvpaper wallpaper engine";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.mpvpaper
    ];
  };
}
