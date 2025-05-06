{ options, config, lib, pkgs, ... }:

with lib;
with lib.types;

let
  cfg = config.nyxia.packages.work;
in
{
  options.nyxia.packages.work.enable = mkOption {
    type = bool;
    default = false;
  };

  config = mkIf cfg.enable {
    nyxia.packages.work.enable = true;

    environment.systemPackages = with pkgs;[
      hyprland
      hyprpaper
      hyprsunset
      polybar
    ];

  };

}