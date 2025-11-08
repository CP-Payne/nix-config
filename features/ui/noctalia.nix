{
  lib,
  pkgs-unstable,
  config,
  inputs,
  ...
}: let
  cfg = config.features.ui.noctalia;
in {
  options.features.ui.noctalia.enable = lib.mkEnableOption "Enable Noctalia quickshell";


    imports = [
	inputs.noctalia.nixosModules.default
    ];

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      inputs.noctalia.packages.${pkgs-unstable.system}.default
    ];

    services.noctalia-shell.enable = true;

  };


}
