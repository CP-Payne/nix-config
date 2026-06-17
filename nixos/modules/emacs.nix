{ config, pkgs, ... }:
{
  # System-level concerns (fonts)
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    symbola
  ];

  # User-level concerns via home-manager
  home-manager.users.charles = {
    home.packages = with pkgs; [
      emacs
      ripgrep
      fd
      shellcheck
      pandoc
    ];
  };
}