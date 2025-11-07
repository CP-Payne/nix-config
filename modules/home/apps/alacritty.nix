{lib, config, pkgs, ... }:
lib.mkIf config.profile.apps.alacritty.enable {
	programs.alacritty = {
		enable = true;
		settings = {
			window.opacity = 0.9;
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
}
