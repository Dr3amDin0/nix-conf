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
    programs.nix-ld.enable = true;
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    environment.systemPackages = with pkgs;[
      rustc
      cargo
      gcc
      rust-analyzer
      rustfmt
      lua51Packages.luarocks
      lua51Packages.lua
      lua
      statix
    ];
  };
}
