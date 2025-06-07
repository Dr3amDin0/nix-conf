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
      zam-plugins
      calf
      swh_lv2
      dconf
      dbus
    ];

    services.pipewire.wireplumber.enable = true;
    services.dbus.enable = true;

    services.pipewire.extraConfig.pipewire."20-pulse-properties.conf" = {
      "context.properties" = {
        name = "libpipewire-module-protocol-pulse";
        args = { };
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 1024;
        "default.clock.max-quantum" = 1024;
        "session.suspend-timeout-seconds" = 0;
      };
      "pulse.properties" = {
        "pulse.min.req" = "1024/48000";
        "pulse.min.frag" = "1024/48000";
        "pulse.min.quantum" = "1024/48000";
        "pulse.default.frag" = "1024/48000";
        "pulse.default.tlength" = "1024/48000";
        "pulse.fix.format" = "S16LE";
        "pulse.idle.timeout" = "0";
      };
    };
  };
}
