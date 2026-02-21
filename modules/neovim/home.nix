{ config, pkgs, ... }:
{
  programs.neovim.enable = true;
  xdg.configFile."nvim/init.lua".source = ./init.lua;
}
