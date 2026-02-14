{ confg, pkgs, ... }:

{

  networking = {
    hostName = "nixos"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    #useDHCP = true;
    #dhcpcd.enable = true;

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    wireless.iwd = {
      enable = false;
      settings = {
        Network = {
          EnableIPv6 = true;
        };
        Settings = {
          AutoConnect = true;
        };
      };
    };
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [
        53
        20
        21
        22
        80
        443
      ];
      allowedUDPPorts = [ 53 ];
      allowedUDPPortRanges = [
        {
          from = 4000;
          to = 7000;
        }
        {
          from = 8000;
          to = 8010;
        }
      ];
      interfaces = {
        "Mihomo" = {
          allowedTCPPorts = [
            53
            20
            21
            22
            80
            443
          ];
          allowedUDPPorts = [ 53 ];
          allowedUDPPortRanges = [
            {
              from = 4000;
              to = 7000;
            }
            {
              from = 8000;
              to = 8010;
            }
          ];
        };
        incusbr0 = {
          allowedTCPPorts = [
            53
            67
          ];
          allowedUDPPorts = [
            53
            67
          ];
        };
      };
    };
  };

  programs.clash-verge = {
    enable = true;
    autoStart = false;
    tunMode = true;
    serviceMode = true;
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      # AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      AllowUsers = [ "dot" ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };
}
