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

       home.file.".mbsyncrc".text = ''
       IMAPAccount fuguel
       HOST redbull.mxrouting.net
       Port 993
       User nyx@fuguel.xyz
       PassCmd "cat ~/.config/mbsync/pass"
       TLSTType IMAPS
       AuthMechs LOGIN

       IMAPStore fuguel-remote
       Account fuguel

       MaildirStore fuguel-local
       Path /home/nyx/mail
       Inbox /home/nyx/mail/INBOX
       SubFolders Verbatim

       Channel fuguel
       Far :fuguel-remote:
       Near :fuguel-local:
       Patterns *
       Create Both
       SyncState *
      '';


      home.packages = with pkgs; [
         neomutt
         isync
         msmtp
         w3m
   ];
}


