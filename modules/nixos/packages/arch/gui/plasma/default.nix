# Enable Hyprland and enable gpu acceleration
{ options, config, lib, pkgs, ... }:

with lib;
with lib.types;
let
  cfg = config.nyxia.packages.plasma;
in
{

  options.nyxia.packages.plasma.enable = mkOption {
    type = bool;
    default = false;
  };
  config = mkIf cfg.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.wayland.enable = false;
    services.displayManager.sddm.enable = false;
    services.xserver.displayManager.lightdm.enable = false;

    #services.desktopManager.plasma6.enable = true;
    #programs.xwayland.enable = true;
    environment.systemPackages = [
      pkgs.libX11
      pkgs.libxcb
      pkgs.libXi
    ];
    # Configure keymap in X11
    # services.xserver.xkb = {
    #  layout = "us";
    #  variant = "";
  };
}
