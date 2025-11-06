{ lib, ... }:
let
	inherit (lib) mkEnableOption mkIf;
in {
	options.profile = {
		desktop.niri.enable = mkEnableOption "Niri as Wayland compositor";

		# Apps
		apps.neovim.enable = mkEnableOption "Neovim editor";
	};
}
