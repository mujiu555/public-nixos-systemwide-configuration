{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
    fuzzel
    vesktop
    kitty
    wl-clipboard
  ];
  #services.vicinae.enable = true;
}
