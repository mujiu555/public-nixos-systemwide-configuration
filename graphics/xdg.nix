{
  config,
  lib,
  pkgs,
  ...
}:
{

  xdg = {
    mime.enable = true;
    autostart.enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      wlr = {
        enable = false;
        settings = {
          screencast = {
            output_name = "eDP-1";
          };
        };
      };
      configPackages = with pkgs; [
        gnome-session
      ];
      extraPortals = with pkgs; [
        xdg-desktop-portal
        gnome-keyring
      ];
      config = {
        common = {
          default = [ "gnome" ];
        };
        niri = {
          default = [
            "gnome"
            "gtk"
          ];
        };
      };
    };
    sounds.enable = true;
    icons = {
      enable = true;
      fallbackCursorThemes = [ ];
    };
    terminal-exec = {
      enable = true;
      settings = {
        default = [
          "kitty.desktop"
        ];
      };
    };
  };
}
