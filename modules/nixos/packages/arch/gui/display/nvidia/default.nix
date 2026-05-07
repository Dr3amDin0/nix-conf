# Enable the Nvidia Drivers 
{ options, config, lib, pkgs, ... }:

with lib;
with lib.types;
let
  cfg = config.nyxia.packages.nvidia;
in
{
  options.nyxia.packages.nvidia.enable = mkOption {
    type = bool;
    default = false;
  };

  config = mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        libva-vdpau-driver
      ];
    };
    environment.systemPackages = with pkgs;[
      nvtopPackages.nvidia
    ];
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
      #Sets the Nvidia Driver thing 
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      #Required as per https://nixos.wiki/wiki/Nvidia
      modesetting.enable = true;
      powerManagement.enable = false;
      open = true;
      nvidiaSettings = true;
    };
  };
}
