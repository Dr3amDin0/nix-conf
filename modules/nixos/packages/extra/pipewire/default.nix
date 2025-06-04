{ options, config, lib, pkgs, ... }:

with lib;
with lib.types;
let
  cfg = config.nyxia.packages.pipewire;
in
{
  options.nyxia.packages.pipewire.enable = mkOption {
    type = bool;
    default = false;
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true; # if not already enabled
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;
    };

    environment.systemPackages = with pkgs;[
      pwvucontrol
      easyeffects
      lsp-plugins
      zam-plugins
      calf
      swh-plugins
    ];

    programs.easyeffects.enable = true;

    services.pipewire.extraConfig.pipewire."20-pulse-properties.conf" = {
      "context.properties" = {
        name = "libpipewire-module-protocol-pulse";
        args = { };
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 128;
        "default.clock.min-quantum" = 128;
        "default.clock.max-quantum" = 128;
        "session.suspend-timeout-seconds" = 0;
      };
      "pulse.properties" = {
        "pulse.min.req" = "128/48000";
        "pulse.min.frag" = "128/48000";
        "pulse.min.quantum" = "128/48000";
        "pulse.default.frag" = "128/48000";
        "pulse.default.tlength" = "128/48000";
        "pulse.fix.format" = "S16LE";
        "pulse.idle.timeout" = "0";
      };
    };
  };
}
