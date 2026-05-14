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
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    services.pipewire.wireplumber.enable = true;

    services.dbus.enable = true;

    environment.systemPackages = with pkgs; [
      pwvucontrol
      easyeffects
      zam-plugins
      calf
      swh_lv2
      dconf
      dbus
    ];

    services.pipewire.extraConfig.pipewire."20-pulse-properties.conf" = {
      "context.properties" = {
        name = "libpipewire-module-protocol-pulse";
        args = { };
        "default.clock.rate" = 48000;
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
