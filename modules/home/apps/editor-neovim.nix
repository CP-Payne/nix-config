{ lib, config, pkgs, ... }:
lib.mkIf config.profile.apps.neovim.enable {
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
	};
	#xdg.configFile."nvim".source = ../../dotfiles/nvim;
}
