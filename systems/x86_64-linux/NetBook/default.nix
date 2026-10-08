{ inputs, pkgs, ... }:

{
  imports = [ 
      ./hardware.nix
      inputs.nixos-hardware.nixosModules.apple-t2
  ];

  # load from namespace
  nyxia = {

    packages = {
      # install core packages
      netbook.enable = true;
    };

    # create user
    users = {
      dream = {
        # user parameters
        isGuiUser = true;
        isSudoUser = true;
        isKvmUser = true;
        initialPassword = "kako";
        # edit git entry        
        git = {
          userName = "Dr3amDin0";
          userEmail = "github@dr3amdin0.com";
        };
      };
    };
  };

  # system configuration
  system = {
    nixos.label = "revision";
    stateVersion = "25.11";
  };

  # bootloader configuration
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.efiSysMountPoint = "/boot";
  };

  # set timezone
  time = {
    timeZone = "Europe/Berlin";
    hardwareClockInLocalTime = true;
  };

  # service configuration            
  services = {
    resolved.enable = true;
  };

  # networking configuration
  networking = {
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  # t2linux
  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
    "pm_async=off"
  ];

  # T2 keyboard/Touch Bar
  boot.kernelModules = [
    "t2bce_vhci"
  ];

  boot.extraModprobeConfig = ''
    options hid-appletb-kbd mode=1
  '';

}


