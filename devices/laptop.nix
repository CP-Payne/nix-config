{lib, ...}: {
  # Device traits: battery-powered machine with Wi-Fi.
  networking.networkmanager.enable = lib.mkDefault true;
  features.services.bluetooth.enable = lib.mkDefault true;
  services.tlp.enable = lib.mkDefault true;
}
