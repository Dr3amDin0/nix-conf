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
    boot.loader.efi.canTouchEfiVariables = true;
  };

  # set timezone
  time = {
    timeZone = "Europe/Berlin";
    hardwareClockInLocalTime = true;
  };

  # service configuration            
  services = {
    resolved.enable = true;
    libinput.enable = true;
  };

  # networking configuration
  networking = {
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };
}


