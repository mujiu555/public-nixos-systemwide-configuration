{
  config,
  lib,
  pkgs,
  ...
}:
{
  #imports = [
  #  inputs.noctalia.nixosModules.default
  #];
  # services.xserver.displayManager.session = [
  #   {
  #     manage = "wayland";
  #     name = "niri";
  #     start = ''
  #       ${pkgs.niri}/bin/niri-session &
  #     '';
  #   }
  # ];
  programs.niri = {
    enable = true;
  };
  #services.noctalia-shell.enable = true;
}
