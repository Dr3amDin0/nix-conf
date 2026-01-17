{ pkgs, ... }:

{
  imports =
    [ ./hardware.nix ];

  # load from namespace
  nyxia = {

    packages = {
      # install core packages
      core.enable = true;
      gui.enable = true;
      plasma.enable = true;
      work.enable = true;
      guitar.enable = true;
      nvidia.enable = true;
      programming.enable = true;
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
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
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
  "1.0.0.1"
  "8.8.8.8"
  "8.8.4.4"
  ];
  };
}


