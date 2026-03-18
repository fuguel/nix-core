# rust.nix
{ config, pkgs, ... }:

{
  # Use the same key your nix.nix uses for system-wide packages
  environment.systemPackages = with pkgs; [
    rust-analyzer           # LSP
    rustPackages.rustfmt    # formatter
    rustPackages.cargo      # build tool
    rustPackages.rustc      # compiler
  ];
}
