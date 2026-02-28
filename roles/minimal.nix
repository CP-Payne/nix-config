{pkgs, ...}: {
  imports = [
    ./base.nix
  ];

  features.shell.zsh.enable = true;
  features.apps.editors.neovim.enable = true;

  environment.systemPackages = with pkgs; [
    htop
    tmux
  ];
}
