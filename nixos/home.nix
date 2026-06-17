{ config, pkgs, ... }:
{
  home.username = "charles";
  home.homeDirectory = "/home/charles";
  home.stateVersion = "26.05";

  programs.git = {
    enable = true;
    userName = "charles";
    userEmail = "charlethical1@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # this gets added to ~/.profile or similar session files
  # GNOME does not always source these files for terminals
  # use home.sessionVariables instead for gnome in configuration nix
  #home.sessionPath = [ "$HOME/.config/emacs/bin" ];
  home.sessionPath = [ "/home/charles/.config/emacs/bin" ];

  # Packages managed at the user level (empty for now, add here over time)
  home.packages = with pkgs; [
    wezterm
    ghostty
    obsidian

    # Python
    python3
    python3Packages.pip

    # Go
    go

    # C
    gcc
    gnumake
    gdb
  ];
}
