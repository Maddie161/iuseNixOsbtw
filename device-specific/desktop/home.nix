{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../home-manager/home.nix
    ./compat-element.nix
  ];
}
