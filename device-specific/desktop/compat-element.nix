# device-specific/desktop/compat-element.nix
{ lib, config, pkgs, ... }:

{
  options.programs.element-desktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Compatibility shim: pretend Element Desktop option exists.";
  };

  options.programs.element-desktop.settings = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    default = {};
    description = "Compatibility shim: placeholder settings for Element Desktop.";
  };

  config = {};
}
