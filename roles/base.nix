{
  vars,
  pkgs,
  ...
}: {
  imports = [
    # Desktop/session modules
    ../desktop/default.nix
    ../desktop/niri.nix
    ../desktop/hyprland.nix
    ../desktop/xfce.nix
    ../desktop/plasma-x11.nix
    ../features/login/greetd.nix

    # System
    ../system/nix.nix
    ../system/boot.nix
    ../system/fonts.nix
    ../system/user.nix

    # Features
    ../features/apps
    ../features/services
    ../features/shell
    ../features/wallpaper/mpvpaper.nix
    ../features/ui/noctalia.nix

    # Home Manager users
    ../home/users/default.nix
  ];

  system.stateVersion = vars.stateVersion;

  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    tree
    alejandra
    file
    curl
  ];
}
