{ lib, config, ... }:

{
    # add cpu driver
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    boot = {
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ ];
    extraModulePackages = [ ];
    };

    # filesystem configurations
    fileSystems."/boot" = {
        device = "/dev/disk/by-label/BOOT";
        fsType = "vfat";
    };
    
    fileSystems."/" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvol=@" "compress=zstd" "noatime" ];
    };

    fileSystems."/home" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvol=@home" "compress=zstd" "noatime" ];
    };

    fileSystems."/nix" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };

    fileSystems."/var" = {
        device = "/dev/disk/by-label/NIX";
        fsType = "btrfs";
        options = [ "subvol=@var" "compress=zstd" "noatime" ];
    };
}