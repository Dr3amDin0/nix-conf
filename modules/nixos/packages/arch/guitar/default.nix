{ config, lib, pkgs, ... }:

let
  cfg = config.nyxia.packages.guitar;
in
{
  options.nyxia.packages.guitar.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.guitarix.overrideAttrs (old: {
        buildInputs = (old.buildInputs or []) ++ [
          pkgs.boost.dev
        ];
      }))

      pkgs.qpwgraph
      pkgs.jack1
    ];

    security.pam.loginLimits = [
      {
        domain = "@audio";
        item = "memlock";
        type = "-";
        value = "unlimited";
      }
      {
        domain = "@audio";
        item = "rtprio";
        type = "-";
        value = "99";
      }
      {
        domain = "@audio";
        item = "nofile";
        type = "soft";
        value = "99999";
      }
      {
        domain = "@audio";
        item = "nofile";
        type = "hard";
        value = "99999";
      }
    ];

    services.udev.extraRules = ''
      KERNEL=="rtc0", GROUP="audio"
      KERNEL=="hpet", GROUP="audio"
    '';
  };
}
