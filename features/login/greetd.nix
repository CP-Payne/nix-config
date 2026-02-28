{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.features.login.greetd;
  sessionCmd = config.desktop.session.cmd or "${pkgs.coreutils}/bin/true";
in {
  options.features.login.greetd = {
    enable = lib.mkEnableOption "Enable greetd display/login manager";
    showTime = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    remember = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    services.greetd.enable = true;

    environment.systemPackages = [pkgs.greetd.tuigreet];

    services.greetd.settings = {
      default_session = {
        user = "greeter";
        command = lib.concatStringsSep " " (
          [
            "${pkgs.greetd.tuigreet}/bin/tuigreet"
          ]
          ++ lib.optional cfg.showTime "--time"
          ++ lib.optional cfg.remember "--remember"
          ++ [
            "--remember-session"
            "--asterisks"
            "--cmd"
            (lib.escapeShellArg sessionCmd)
          ]
        );
      };
    };
  };
}
