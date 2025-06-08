{ options, config, lib, pkgs, ... }:

with lib;
with lib.types;

let
  cfg = config.nyxia.packages.programming;
in
{
  options.nyxia.packages.programming.enable = mkOption {
    type = bool;
    default = false;
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;[
      jetbrains.rust-rover
      rustc
      cargo
      rustfmt
      clippy
      rustup
      rust-analyzer
    ];
  };
}
