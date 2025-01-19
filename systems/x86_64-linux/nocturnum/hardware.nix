{ lib, config, ... }:

{
    # add cpu driver
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    # boot configurations
    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];

    # filesystem configurations
    fileSystems."/boot" = {
        device = "/dev/disk/by-label/BOOT";
        fsType = "vfat";
    };
    
    fileSystems."/" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvolumes=@" "compress=zstd" "noatime" ];
    };

    fileSystems."/home" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvolumes=@home" "compress=zstd" "noatime" ];
    };

    fileSystems."/nix" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvolumes=@nix" "compress=zstd" "noatime" ];
    };

    fileSystems."/var" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvolumes=@var" "compress=zstd" "noatime" ];
    };

    swapDevices = 
    [
        { 
            device = "/dev/disk/by-label/SWAP";
        }
    ];

}