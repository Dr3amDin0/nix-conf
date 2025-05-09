{ options, config, lib, pkgs, ... }:

with lib;
with lib.types;

let
  cfg = config.nyxia.packages.gui;
in
{
  options.nyxia.packages.gui.enable = mkOption {
    type = bool;
    default = false;
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;[
      hyprland
      hyprpaper
      hyprsunset
      hyprcursor
      waybar
      wayland
      xwayland
      xorg.xrdb
      xsettingsd
      gamescope
      alsa-scarlett-gui
      playerctl
      gtk3
      mesa
      libappindicator-gtk3
    ];

    fonts.packages = with pkgs; [
      font-awesome
      fira-code-nerdfont
    ];

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs;[
        #xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    programs.hyprland.xwayland.enable = true;
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs;[
        vpl-gpu-rt
      ];
    };
  };
}
