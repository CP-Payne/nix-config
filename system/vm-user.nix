{...}: {
  imports = [
    ./user.nix
  ];

  profiles.user.extraGroups = ["vboxsf"];
}
