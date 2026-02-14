inputs@{
  config,
  lib,
  pkgs,
  ...
}:

{

  imports = [
    ./graphics/wayland.nix
    ./graphics/xdg.nix
    ./graphics/xorg.nix
    ./graphics/env.nix
  ];

  systemd = {
    packages = with pkgs; [ lact ];
    services.lactd.wantedBy = [ "multi-user.target" ];
    tmpfiles.rules = [
      "L+    /opt/rocm/hip    -    -    -    -    ${pkgs.rocmPackages.clr}"
    ];
  };

  services.dbus.enable = true;

}
