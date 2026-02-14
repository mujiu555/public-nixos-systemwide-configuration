{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./user/user.nix
  ];
}
