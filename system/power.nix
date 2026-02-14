{
  pkgs,
  config,
  lib,
  vars,
  ...
}:

{
  hardware.system76.power-daemon.enable = true;
  services.system76-scheduler.settings.cfsProfiles.enable = true;
  services.thermald.enable = true;
  services.power-profiles-daemon.enable = false;
  services = {
    tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 1;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 1;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "balanced";
        START_CHARGE_THRESH_BAT0 = 75;
        STOP_CHARGE_THRESH_BAT0 = 91;
      };
    };
    upower = {
      enable = true;
    };
  };
  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "schedutil";
  };
  environment.systemPackages = with pkgs; [
    powertop
  ];

  services.logind.settings = {
    Login = {
      HandleLidSwitch = "hibernate";
      HandleLidSwitchExternalPower = "suspend-then-hibernate";
      HandleLisSwitchDocked = "ignore";
      HandlePowerKey = "suspend-then-hibernate";
      HandlePowerKeyLongPress = "poweroff";
    };
  };
  boot.kernelParams = [ "mem_sleep_default=deep" ];

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=30m
    SuspendState=mem
  '';
}
