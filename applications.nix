{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./applications/fhs.nix
    ./applications/appimage.nix
    ./applications/wine.nix
    ./applications/editor.nix
    ./applications/browser.nix
  ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

}
