{ options, config, lib, pkgs, ... }:

with lib;
with lib.types;

let
  cfg = config.nyxia.packages.guitar;
in
{
  options.nyxia.packages.guitar.enable = mkOption {
    type = bool;
    default = false;
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;[
      guitarix
      qpwgraph
    ];
  };
}
