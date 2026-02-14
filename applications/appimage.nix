{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.appimage = {
    enable = true;
    binfmt = true;
    package = pkgs.appimage-run.override {
      extraPkgs =
        pkgs: with pkgs; [
          xorg.libX11
          keybinder3
          libnotify
          libepoxy
        ];
    };
  };
}
