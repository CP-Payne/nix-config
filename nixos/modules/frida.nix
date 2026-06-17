{ config, pkgs, ... }:
{

  # System level
  system.userActivationScripts.fridaVenv = {
    text = ''
        if [ ! -d "/home/charles/.venvs/frida17.9.8" ]; then
        echo "Setting up Frida virtual environment..."
        ${pkgs.python3}/bin/python3 -m venv /home/charles/.venvs/frida17.9.8
        /home/charles/.venvs/frida17.9.8/bin/pip install frida==17.9.8 frida-tools objection
        fi
    '';
  };
  # User-level concerns via home-manager
  home-manager.users.charles = {
    programs.bash = {
      enable = true;
      shellAliases = {

      frida-env = "source ~/.venvs/frida17.9.8/bin/activate";
      };
    };
  };
}
