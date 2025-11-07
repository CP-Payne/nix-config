{ lib, config, ... }:
	let cfg = config.features.services.bluetooth;
	in {
		options.features.services.bluetooth.enable = lib.mkEnableOption "Bluetooth support";

		config = lib.mkIf cfg.enable {
			hardware.bluetooth.enable = true;
			services.blueman.enable = true;
		};
}
