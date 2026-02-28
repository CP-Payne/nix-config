{...}: {
  imports = [
    # Hardware stays host-specific, even with device layering.
    ./hardware-configuration.nix
  ];

  # Host-specific overrides.
  features.services.bluetooth.enable = false;
}
