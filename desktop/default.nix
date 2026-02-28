{
  lib,
  config,
  ...
}: let
  cfg = config.desktop;
in {
  options.desktop = {
    session.type = lib.mkOption {
      type = lib.types.enum ["none" "niri" "hyprland" "xfce" "plasma-x11"];
      default = "none";
      description = "Desktop session to launch by default.";
    };

    session.cmd = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Command used by display/login managers to launch the selected desktop session.";
    };
  };

  config.assertions = [
    {
      assertion =
        (lib.length (lib.filter (x: x) [
            cfg.niri.enable
            cfg.hyprland.enable
            cfg.xfce.enable
            cfg.plasmaX11.enable
          ]))
        <= 1;
      message = "Enable at most one of desktop.niri.enable, desktop.hyprland.enable, desktop.xfce.enable, or desktop.plasmaX11.enable. Prefer desktop.session.type to choose the active desktop.";
    }
  ];
}
