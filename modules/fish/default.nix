{ Config, pkgs, ... }:
{
     programs.fish = {
             enable = true;
             interactiveShellInit = ''starship init fish | source'';
                     };
   environment.systemPackages = with pkgs; [ starship fzf fd bat grc 
                                             fishPlugins.fzf-fish
                                             fishPlugins.done
                                             fishPlugins.grc
                                            ];



}
