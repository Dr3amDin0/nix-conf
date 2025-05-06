{ options, config, lib, pkgs, ... }:

with lib;
with lib.types;

let
  cfg = config.nyxia.packages.core;
in
{
  options.nyxia.packages.core.enable = mkOption {
    type = bool;
    default = false;
  };

remmina