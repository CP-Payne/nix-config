{
  vars,
  pkgs,
  ...
}: {
  home-manager.users.${vars.username} = {
    imports = [
      ../profiles/workstation.nix # universal Home Manager defualts

      ../modules/apps/alacritty.nix
      ../modules/editors/neovim.nix
      ../modules/shell/zsh.nix
      #../dev/languages.nix
    ];
    # home.username + home.homeDirectory default to signedin user

    home.stateVersion = vars.stateVersion;

    home.packages = with pkgs; [
      bat
    ];

    programs.git = {
      enable = true;
      userName = vars.fullName;
      userEmail = vars.email;
    };

    # Flip HM toggles you want active for this user
    hm.apps.alacritty.enable = true;
    hm.editors.neovim.enable = true;
    hm.shell.zsh.enable = true;

    programs.home-manager.enable = true;
  };
}
