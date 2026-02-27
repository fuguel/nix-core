{ pkgs, ... }:
{
  programs.neomutt = {
      enable = true;
  
      extraConfig = ''
        set realname = "Jand"
        set from = "nyx@fuguel.xyz"

        set folder = "~/mail"
        set spoolfile = "+INBOX"
        set mbox_type = "Maildir"

        set sendmail = "${pkgs.msmtp}/bin/msmtp"
       '';
  };


home.packages = with pkgs; [
         isync
         msmtp
         w3m
   ];
}


