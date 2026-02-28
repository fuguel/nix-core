{ pkgs, ... }:
{
      home.file.".config/neomutt/neomuttrc".text = ''
      set realname = "Jand"
      set from = "nyx@fuguel.xyz"

      set folder = "~/mail"
      set spoolfile = "+INBOX"
      set mbox_type = "Maildir"
      set record = "+Sent"
        set sendmail = "${pkgs.msmtp}/bin/msmtp"
       '';

       home.file.".mbsyncrc".text = ''
       IMAPAccount fuguel
       HOST redbull.mxrouting.net
       Port 993
       User nyx@fuguel.xyz
       PassCmd "cat ~/.config/mbsync/pass"
       TLSType IMAPS
       AuthMechs LOGIN

       IMAPStore fuguel-remote
       Account fuguel

       MaildirStore fuguel-local
       Path /home/nyx/mail/
       Inbox /home/nyx/mail/INBOX
       SubFolders Verbatim

       Channel fuguel
       Far :fuguel-remote:
       Near :fuguel-local:
       Patterns *
       Create Both
       SyncState *
      '';

      programs.msmtp = {
         enable = true;

        configContent = ''
        account fuguel
        host redbull.mxrouting.net
        port 465
        from nyx@fuguel.xyz
        user nyx@fuguel.xyz
        passwordeval "cat /home/nyx/.config/mbsync/pass"
        tls on
        tls_starttls off
        auth on
        account default : fuguel
            '';    
                
       
    };


      home.packages = with pkgs; [
         neomutt
         isync
         w3m
   ];
}

