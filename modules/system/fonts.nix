{ pkgs, ... }:

{
# Normal Nerd Fonts
  # fonts = {
  #   packages = with pkgs; [
  #     jetbrains-mono
  #     fira-code
  #     hack-font
  #     iosevka
  #     cascadia-code
  #   ];

 fonts.packages = [
	pkgs.nerd-fonts.jetbrains-mono
	pkgs.nerd-fonts.fira-code
	pkgs.nerd-fonts.iosevka
	pkgs.nerd-fonts.iosevka-term
 ];

fonts.fontconfig.defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "FiraCode Nerd Font" ];
    };
}
