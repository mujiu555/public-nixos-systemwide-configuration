{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./drivers/audio.nix
    ./drivers/bluetooth.nix
    ./drivers/network.nix
    ./drivers/ntfs.nix
    ./drivers/stlink.nix
    ./drivers/usb.nix
    ./drivers/graphics.nix
  ];
}
