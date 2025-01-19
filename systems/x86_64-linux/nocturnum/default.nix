{config, pkgs, ...}:

{
    imports =
        [./hardware.nix];

        # load from namespace
        nyxia = {

            packages = {
                core.nix = true;
            };

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

        # system configuration
        system = {
            nixos.label = "revision";
            stateVersion = "25.05";
        };

        # bootloader configuration
        boot = {
            loader.systemd-boot.enable = true;
            loader.efi.canTouchEfiVariables = true;
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
        };
}


