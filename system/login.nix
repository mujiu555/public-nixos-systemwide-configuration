{
  config,
  lib,
  pkgs,
  ...
}:
{
  #services.getty.loginProgram = "${pkgs.niri}/bin/niri";
  services.displayManager = {
    enable = true;
    autoLogin.user = "dot";
    ly = {
      enable = false;
      settings = {
        animation = "colormix";
      };
    };
  };
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd}/bin/agreety --cmd ${pkgs.niri}/bin/niri-session";
        user = "dot";
      };
      initial_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "dot";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    greetd
  ];
}
