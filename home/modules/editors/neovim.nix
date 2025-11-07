{ lib, config, pkgs, ... }:
	let cfg = config.hm.editors.neovim;
	in {
		options.hm.editors.neovim.enable = lib.mkEnableOption "Neovim config in HM";

		config = lib.mkIf cfg.enable {

			programs.neovim = {
				enable = true;
				defaultEditor = true;
				extraPackages = with pkgs; [ ripgrep fd ];
				viAlias = true;
				vimAlias = true;
				# add other plugins/LSP here later
			};
		};
}
