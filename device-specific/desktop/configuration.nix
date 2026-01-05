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
  networking.hostName = "desktop";
  environment.systemPackages = with pkgs; [
    kdePackages.kolourpaint
    legendary-gl
    rare
    zls
    cava
  ];
}
