{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.features.apps.editors.neovim;
in {
  options.features.apps.editors.neovim.enable = lib.mkEnableOption "Enable Neovim system-wide";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [neovim ripgrep fd];
  };
}
