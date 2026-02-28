{lib, ...}: {
  # Device traits: NixOS running as a VirtualBox guest.
  networking.networkmanager.enable = lib.mkDefault true;
  virtualisation.virtualbox.guest.enable = lib.mkDefault true;
}
