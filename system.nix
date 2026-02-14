{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./system/boot.nix
    ./system/fonts.nix
    ./system/localization.nix
    ./system/power.nix
    ./system/security.nix
    ./system/virt.nix
    ./system/login.nix
  ];
}
