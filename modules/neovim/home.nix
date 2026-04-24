{ config, pkgs, ... }:
{
   programs.neovim = {
   enable = true;
   withRuby = true;
   withPython3 = true;
   defaultEditor = true;
   };
 home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
  };
programs.bash.enable = true;


 xdg.configFile."nvim/init.lua".source = ./init.lua;
}
