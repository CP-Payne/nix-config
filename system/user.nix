{
  config,
  lib,
  pkgs,
  vars,
  ...
}: {
  options.profiles.user.extraGroups = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [];
    description = "Additional groups to add for ${vars.username} on specific hosts/roles.";
  };

  # Don't forget to set password with 'passwd'.
  config.users.users.${vars.username} = {
    isNormalUser = true;
    extraGroups =
      ["wheel" "networkmanager" "audio" "video"]
      ++ config.profiles.user.extraGroups;
    description = vars.fullName;
    shell = pkgs.zsh; # if feature enabled
  };
}
