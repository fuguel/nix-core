# python.nix
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pyright                  # Python LSP
    python310Full            # Python interpreter (adjust version if needed)
    python310Packages.black  # Formatter
    python310Packages.pylint # Optional linter / diagnostics
  ];
}