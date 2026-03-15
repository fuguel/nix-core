{ config, pkgs, ... }:
{
  programs.neovim = {
   enable = true;
   defaultEditor = true;
   };
 home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
  };
programs.bash.enable = true;


 xdg.configFile."nvim/init.lua".source = ./init.lua;
}
