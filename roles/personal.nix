{pkgs, ...}: {
  imports = [
    ./base.nix
  ];

  desktop.session.type = "niri";
  features.login.greetd.enable = true;
  features.ui.noctalia.enable = false;

  features.shell.zsh.enable = true;
  features.apps.alacritty.enable = true;
  features.apps.browsers.firefox.enable = true;
  features.apps.editors.neovim.enable = true;

  features.wallpaper.mpvpaper.enable = false;

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
}
