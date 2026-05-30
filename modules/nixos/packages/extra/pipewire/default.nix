{ options, config, lib, pkgs, ... }:

with lib;

let
  cfg = config.nyxia.packages.pipewire;
in
{
  options.nyxia.packages.pipewire.enable = mkOption {
    type = types.bool;
    default = false;
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;

    services.dbus.enable = true;

    services.pipewire = {
      enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      pulse.enable = true;

      wireplumber.enable = true;

      extraConfig = {
        # Stable global audio clock
        pipewire."10-clock.conf" = {
          "context.properties" = {
            "default.clock.rate" = 48000;
            "default.clock.allowed-rates" = [ 48000 ];
          };
        };

        # PulseAudio compatibility layer
        pipewire-pulse."20-pulse-properties.conf" = {
          "pulse.properties" = {
            "pulse.fix.format" = "S16LE";

            # Stable shared-mode buffering
            "pulse.default.req" = "1024/48000";
            "pulse.default.frag" = "1024/48000";
            "pulse.default.tlength" = "1024/48000";

            "pulse.min.req" = "512/48000";
            "pulse.min.quantum" = "512/48000";

            # Prevent suspend-related crackles/pops
            "session.suspend-timeout-seconds" = 0;
            "pulse.idle.timeout" = 0;
          };
        };
      };
    };

    environment.systemPackages = with pkgs; [
      pwvucontrol
      dconf
      dbus
    ];
  };
}
