{ pkgs, ... }:
{
  programs.neomutt = {
      enable = true;
  };

  home.packages = with pkgs; [
         isync
         msmtp
         w3m
   ];
}


