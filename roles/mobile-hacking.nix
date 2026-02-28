{pkgs, ...}: {
  imports = [
    ./personal.nix
  ];

  environment.systemPackages = with pkgs; [
    nmap
    tcpdump
    wireshark
    aircrack-ng
    hashcat
    john
    hydra
  ];
}
