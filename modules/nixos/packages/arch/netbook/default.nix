{ options, config, lib, pkgs, inputs, ... }:

with lib;
with lib.types;

let
  cfg = config.nyxia.packages.netbook;
in
{
  options.nyxia.packages.netbook.enable = mkOption {
    type = bool;
    default = false;
  };

  config = mkIf cfg.enable {
    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;

    };
    environment.systemPackages = with pkgs;[
      openssh
      fastfetch
      fish
      btop
    ];
  };
}

