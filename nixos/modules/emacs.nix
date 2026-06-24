{ config, pkgs, ... }:
{
  # System-level concerns (fonts)
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    symbola
    nerd-fonts.fira-code
    cantarell-fonts
  ];

environment.systemPackages = with pkgs; [
  # ... your existing packages ...
  aspell
  aspellDicts.en
];

  # User-level concerns via home-manager
  home-manager.users.charles = {
    home.packages = with pkgs; [
      emacs
      ripgrep
      fd
      shellcheck
      pandoc

      cmake
      gopls
      gomodifytags
      gotests
      gore
      wl-clipboard # For wayland and xclip for x11
      #xclip
      maim
      graphviz
      shfmt
    ];
  };
}