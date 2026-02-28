{pkgs, ...}: {
  imports = [
    ./personal.nix
  ];

  features.apps.browsers.chromium.enable = true;

  environment.systemPackages = with pkgs; [
    burpsuite
    sqlmap
    ffuf
    gobuster
    nikto
  ];
}
