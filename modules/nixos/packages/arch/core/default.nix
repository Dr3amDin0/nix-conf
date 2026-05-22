{ options, config, lib, pkgs, inputs, ... }:

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

  config = mkIf cfg.enable {
    nyxia.packages.pipewire.enable = true;
    services.dbus.enable = true;

    services.upower.enable = true;

    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
    #test
    environment.systemPackages = with pkgs;[
      openssh
      fastfetch
      gamemode
      rofi
      kitty
      fish
      vesktop
      protonup-qt
      protontricks
      firefox
      ranger
      btop
      obsidian
      unzip
      sbctl
      pinta
      dolphin-emu
      wheelwizard
      tidal-hifi
      osu-lazer-bin
    ];
  };
}

