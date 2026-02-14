{
  config,
  lib,
  pkgs,
  ...
}:
{

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "zh_CN.UTF-8";
      LC_IDENTIFICATION = "zh_CN.UTF-8";
      LC_MEASUREMENT = "zh_CN.UTF-8";
      LC_MONETARY = "zh_CN.UTF-8";
      LC_NAME = "zh_CN.UTF-8";
      LC_NUMERIC = "zh_CN.UTF-8";
      LC_PAPER = "zh_CN.UTF-8";
      LC_TELEPHONE = "zh_CN.UTF-8";
      LC_TIME = "zh_CN.UTF-8";
    };
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5 = {
        addons = with pkgs; [
          fcitx5
          fcitx5-gtk

          fcitx5-configtool

          fcitx5-chinese-addons
          fcitx5-rime

          fcitx5-lua
          fcitx5-table-extra
          fcitx5-table-other

          fcitx5-pinyin-moegirl
          fcitx5-pinyin-zhwiki
          rime-data
        ];
        waylandFrontend = true;
      };
    };
    supportedLocales = [
      "zh_CN.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
    ];
  };

  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  environment.systemPackages = with pkgs; [
    libappindicator
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

}
