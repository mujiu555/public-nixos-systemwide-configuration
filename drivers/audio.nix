{ config, lib, pkgs, modulesPath, ... }:

{
  security.rtkit.enable = true;

  hardware={
    alsa.enable = false;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.extraConfig.bluetoothEnhancements = {
        "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
        };
      };
    };
    pulseaudio = {
      enable = false;
      systemWide = false;
    };
  };
  environment.systemPackages = with pkgs; [
    alsa-utils
    alsa-firmware
    alsa-lib
    pulseaudio
    pulseaudio-ctl
    pipewire
    pamixer
    bluez-tools
    coppwr
  ];
}
