{ pkgs, ... }:
{
        home.file.".config/neomutt/neomuttrc".text = ''
        set realname = "Jand"
        set from = "nyx@fuguel.xyz"

        set folder = "~/mail"
        set spoolfile = "+INBOX"
        set mbox_type = "Maildir"

        set sendmail = "${pkgs.msmtp}/bin/msmtp"
       '';

         home.packages = with pkgs; [
         neomutt
         isync
         msmtp
         w3m
   ];
}


