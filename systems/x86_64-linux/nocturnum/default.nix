{config, pkgs, ...}:

{
    imports =
        [./hardware-configuration.nix];
    

        # load from namespace
        nyxia = {
            # create user
            users = {
                dream = {
                    # user parameters
                    isGuiUser = true;
                    isSudoUser = true;
                    isKvmUser = true;
                    # edit git entry        
                    git = {
                        userName = "Dr3amDin0";
                        userEmail = "github@dr3amdin0.com";
                    };
                };
            };
        };

        # service configuration            
        services = {
            resolved.enable = true;
        };

        # system configuration
        system = {
            nixos.label = "revision";
        };

        # bootloader configuration
        bootloader = {
            boot.loader.systemd-boot.enable = true;
            boot.loader.efi.canTouchEfiVariables = true;
        };

        # networking configuration
        networking = {
            networking.networkmanager.enable = true;
        };

        # set timezone
        time = {
            timeZone = "Europe/Berlin";
            hardwareClockInLocalTime = true;
        };
}


