{pkgs, ...}: {
  imports = [
    # Harware Config
    ./hardware-configuration.nix
    # Roles
    ../../roles/workstation.nix

    # Host specific configurations
    ../../features/services/bluetooth.nix
  ];

  networking.hostName = "laptop";
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  features.services.bluetooth.enable = false;
}
