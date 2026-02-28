{lib, ...}: {
  # Device traits: wired desktop, no Wi-Fi assumptions.
  networking.networkmanager.enable = lib.mkDefault false;
  networking.useDHCP = lib.mkDefault true;
  features.services.bluetooth.enable = lib.mkDefault false;
}
