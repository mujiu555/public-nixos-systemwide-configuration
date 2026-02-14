{
  config,
  lib,
  pkgs,
  ...
}:
{
  boot.extraModprobeConfig = "options kvm_intel nested=1";
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
      allowedBridges = [ "br0" ];
    };
    spiceUSBRedirection.enable = true;
    incus = {
      enable = true;
      preseed = {
        networks = [
          {
            config = {
              "ipv4.address" = "10.0.100.1/24";
              "ipv4.nat" = true;
            };
            name = "incusbr0";
            type = "bridge";
          }
        ];
        profiles = [
          {
            devices = {
              eth0 = {
                name = "eth0";
                network = "incusbr0";
                type = "nic";
              };
            };
            name = "default";
          }
        ];
        storage_pools = [
          {
            config = {
              source = "/var/lib/incus/storage-pools/default";
            };
            driver = "dir";
            name = "default";
          }
        ];
      };
    };
    #virtualbox = {
    #  host = {
    #    enable = true;
    #    enableExtensionPack = true;
    #  };
    #  guest = {
    #    enable = true;
    #    dragAndDrop = true;
    #  };
    #};
  };

  programs.virt-manager.enable = true;
  networking.nftables.enable = true;

  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };
}
