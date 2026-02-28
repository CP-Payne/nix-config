{...}: {
  imports = [
    ./base.nix
  ];

  profiles.user.extraGroups = ["vboxsf"];
}
