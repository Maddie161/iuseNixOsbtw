{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../nixos/configuration.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "laptop";
  systemd.services.nuinternetscriptthingy = {
    description = "internetsharing";
    after = ["network.target" "network-online.target"];
    wants = ["network-online.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = ''nu ~/Documents/wifi.nu'';
      Restart = "always";
      User = "maddie";
    };
  };
}
