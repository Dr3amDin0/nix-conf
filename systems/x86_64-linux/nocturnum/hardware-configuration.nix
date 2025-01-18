{ lib, config, ... }:



    # add cpu driver


    # boot configurations


    # filesystem configurations
    filesystem."/boot" = {
        device = "/dev/disk/by-label/BOOT";
        fsType = "vfat";
    };
    
    filesystem."/" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvolumes=@", "compress=zstd" "noatime" ];
    };

    filesystem."/home" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvolumes=@home", "compress=zstd" "noatime" ];
    };

    filesystem."/nix" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvolumes=@nix", "compress=zstd" "noatime" ];
    };

    filesystem."/var" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvolumes=@var", "compress=zstd" "noatime" ];
    }

    swapDevices = [{ device = "/swap/swapfile";}];