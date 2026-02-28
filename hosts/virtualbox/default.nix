{...}: {
  imports = [
    # Hardware stays host-specific, even with device layering.
    ./hardware-configuration.nix
  ];

  # Host-specific overrides.
  features.services.bluetooth.enable = false;

  # VM-specific user profile additions.
  profiles.user.extraGroups = ["vboxsf"];
}
