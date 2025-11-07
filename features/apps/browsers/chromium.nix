{ config, lib, pkgs, ... }:
	let cfg = config.features.apps.browsers.chromium;
	in {
		options.features.apps.browsers.chromium.enable = lib.mkEnableOption "Install Chromium system wide";

		config = lib.mkIf cfg.enable {
			environment.systemPackages = [ pkgs.chromium ];
		};
}
