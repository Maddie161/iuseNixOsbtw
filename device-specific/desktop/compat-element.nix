# device-specific/laptop/compat-element.nix
{ lib, ... }:

{
  # Declare a minimal programs.element-desktop option set so other modules can reference it.
  options.programs.element-desktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Compatibility shim: pretend Element Desktop option exists (default false).";
  };

  options.programs.element-desktop.settings = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    default = {};
    description = "Compatibility shim: placeholder settings attribute for Element Desktop.";
  };

  config = { }: {
    # no config -- this is just a shim for option declarations
  };
}
