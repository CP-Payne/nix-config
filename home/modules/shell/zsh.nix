{ lib, config, ... }:
	let cfg = config.hm.shell.zsh;
	in {
		options.hm.shell.zsh.enable = lib.mkEnableOption "Configure zsh in HM";

		config = lib.mkIf cfg.enable {
			programs.zsh = {
				enable = true;
				autosuggestion.enable = true;
				syntaxHighlighting.enable = true;
			};
		};
}
