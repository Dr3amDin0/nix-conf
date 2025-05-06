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
    nyxia.packages.gui.enable = true;

    environment.systemPackages = with pkgs;[
      hyprland
      hyprpaper
      hyprsunset
      polybar
    ];

  };

}
