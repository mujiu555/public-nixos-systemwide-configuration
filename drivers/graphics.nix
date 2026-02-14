{
  config,
  lib,
  pkgs,
  ...
}:
{

  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  hardware.amdgpu = {
    opencl.enable = true;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-media-driver
      rocmPackages.clr.icd
      rocmPackages.rocminfo
      glxinfo
      # clinfo

      intel-compute-runtime
      # intel-ocl
      intel-vaapi-driver
      mesa

      vaapiVdpau
      libvdpau-va-gl
    ];
    extraPackages32 = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
    ];
  };
  # hardware.enableRedistributableFirmware = true;
  # boot.kernelParams = [ "i915.enable_guc=3" ];
}
