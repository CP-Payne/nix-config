{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.features.shell.zsh;
in {
  options.features.shell.zsh.enable = lib.mkEnableOption "Enable ZSH Default Shell";

  config = lib.mkIf cfg.enable {
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
  };
}
