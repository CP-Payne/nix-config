{lib, config, ... }:
	let cfg = config.hm.apps.alacritty;
	in {
		options.hm.apps.alacritty.enable = lib.mkEnableOption "Configure Alacritty in Home Manager";

		config = lib.mkIf cfg.enable {
			programs.alacritty = {
				enable = true;
				settings = {
					window.opacity = 0.95;
					window.padding = {
						x = 15;
						y = 25;
					};
					font.normal = {
						family = "JetBrainsMono Nerd Font";
						style = "Regular";
					};
					font.size = 16;
				};
			};
		};
}
