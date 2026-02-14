{
  config,
  lib,
  pkgs,
  ...
}:
{

  environment = {
    sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
      ROC_ENABLE_PRE_VEGA = "1";
      NIXOS_OZONE_WL = "1";
      #XCURSOR_THEME = "Adwaita";
      #XCURSOR_SIZE = "12";
    };

    systemPackages = with pkgs; [
      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      })
      (ffmpeg-full.override { withUnfree = true; })
      clinfo
      lact
      glxinfo
      wayland-utils
      libinput
      xwayland-satellite
      hardinfo2
      mesa
      xdg-desktop-portal

      x265
      x264

      libva-utils

      firefox
      chromium

      brightnessctl

      adwaita-icon-theme

      wlr-randr
      wlr-layout-ui
      wlr-protocols
      wlr-which-key
      wlrctl
      wlroots

      qt6ct
    ];
  };

  environment.etc = {
    "xdg/gtk-3.0/settings.ini" = {
      text = ''
        [Settings]
        gtk-icon-theme-name=Papirus
        gtk-theme-name=Adapta
        gtk-cursor-theme-name=Adwaita
        gtk-cursor-theme-size=128
      '';
      mode = "444";
    };

    "xdg/user-dirs.defaults" = {
      text = ''
        DESKTOP=Desktop
        DOCUMENTS=Documents
        DOWNLOAD=Downloads
        MUSIC=Music
        PICTURES=Pictures
        PUBLICSHARE=Public
        TEMPLATES=Templates
        VIDEOS=Videos
      '';
    };

    "xdg/mimeapps.list" = {
      text = ''
        [Default Applications]
        inode/directory=org.kde.krusader.desktop
        x-scheme-handler/http=brave-browser.desktop
        x-scheme-handler/https=brave-browser.desktop
        x-scheme-handler/org-protocol=org-protocol.desktop
      '';
    };

  };
}
