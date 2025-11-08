{
  lib,
  config,
  pkgs,
  vars,
  ...
}: let
  cfg = config.hm.editors.neovim;
in {
  options.hm.editors.neovim.enable = lib.mkEnableOption "Neovim config in HM";

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      withNodeJs = true;
      withPython3 = true;
      withRuby = false;

    };



  };
}
