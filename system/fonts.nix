{
  config,
  lib,
  pkgs,
  ...
}:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "corefonts" ];
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      corefonts
      adwaita-fonts
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif

      fira-code
      fira-code-symbols
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.im-writing

      liberation_ttf

      sarasa-gothic
      source-code-pro
      jetbrains-mono
      font-awesome
      lxgw-fusionkai
      lxgw-wenkai
      lxgw-wenkai-screen
      lxgw-wenkai-tc
      lxgw-neoxihei
      wqy_microhei
      wqy_zenhei
    ];
    fontconfig = {
      useEmbeddedBitmaps = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Source Han Sans SC"
          "DejaVu Sans"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Source Han Serif SC"
          "DejaVu Serif"
        ];
      };
    };
  };
}
