{config, pkgs, ... }:

{

programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;

  security = {
    pam = {
      services = {
        sudo.u2fAuth = true;
        login.u2fAuth = true;
        login.enableGnomeKeyring = true;
      };
      u2f.settings.cue = true;
    };
    sudo = {
      enable = true;
      extraRules = [{
        commands = [
          {
            command = "${pkgs.systemd}/bin/systemctl suspend";
            options = [ "NOPASSWD" ];
          }
          {
            command = "${pkgs.systemd}/bin/poweroff";
            options = [ "NOPASSWD" ];
          }
          {
            command = "${pkgs.systemd}/bin/reboot";
            options = [ "NOPASSWD" ];
          }
        ];
        groups = [ "wheel" ];
      }];
      extraConfig = with pkgs; ''
        Defaults:picloud secure_path="${lib.makeBinPath [
          systemd
        ]}:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
      '';
    };
    polkit = {
      enable = true;
      extraConfig = ''
        polkit.addRule(function (action, subject) {
          if (subject.isInGroup("wheel")) {
              return polkit.Result.YES;
          }
          if (
            subject.isInGroup("ysers") &&
            [
              "org.freedesktop.login1.reboot",
              "org.freedesktop.login1.reboot-multiple-sessions",
              "org.freedesktop.login1.power-off",
              "org.freedesktop.login1.power-off-multiple-sessions",
            ].indexOf(action.id) !== -1
          ) {
            return polkit.Result.YES;
          }
        });
      '';
    };
    soteria.enable = true;
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  services.dbus.packages = [
    pkgs.gnome-keyring
    pkgs.gcr
  ];
  services.passSecretService.enable = true;
}
