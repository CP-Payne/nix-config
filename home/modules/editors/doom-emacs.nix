{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs-pgtk
    git
    lazygit
    ripgrep
    libtool
    cmake
    pkg-config
    # Spell checking
    hunspell
    hunspellDicts.en_US
    hunspellDicts.en_AU
    hunspellDicts.es_ES
    # LSP servers
    clang-tools # C/C++ LSP
    nil # Nix LSP

    gcc
    gnumake
    cmake
    libvterm
    libtool

    nodejs
    nodePackages.npm

    go
    gopls
    gotests
    gomodifytags
    gore

    maim
    scrot
    graphviz


    python3
    python3Packages.black
    python3Packages.isort
    python3Packages.pyflakes
    pipenv
    python3Packages.pytest
    pyenv

    shfmt
    shellcheck

  ];

xdg.configFile."doom" = {
	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/doom";
	recursive = true;
};


  # 2. Add the bin directory to the PATH
  home.sessionPath = lib.mkBefore [
    "${config.home.homeDirectory}/.config/emacs/bin"
  ];

  # 3. Create a desktop file
  # xdg.desktopEntries.doom-emacs = {
  #   name = "Doom Emacs";
  #   comment = "A configuration framework for GNU Emacs";
  #   exec = "emacs";
  #   icon = doom-icon;
  #   terminal = false;
  #   type = "Application";
  #   categories = [ "Development" "TextEditor" ];
  # };



}


