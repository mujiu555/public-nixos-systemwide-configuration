{
  config,
  lib,
  pkgs,
  ...
}:
{

  services = {
    frigate.vaapiDriver = "radeonsi";
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      videoDrivers = [
        "intel"
        "amdgpu"
      ];
    };
  };

}
