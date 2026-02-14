{
  config,
  lib,
  pkgs,
  ...
}:
{

  programs = {
    firefox = {
      enable = true;
      languagePacks = [
        "zh-CN"
        "en-US"
      ];
    };
  };

  nixpkgs.config = {
    firefox = {
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = true;
    };
    chromium = {
      commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
    };
  };

}
