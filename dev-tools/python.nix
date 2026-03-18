# python.nix
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pyright                 # Python LSP
    python3                 # Python interpreter
    python3.pkgs.black       # Formatter
    python3.pkgs.pylint      # Optional linter
  ];
}
