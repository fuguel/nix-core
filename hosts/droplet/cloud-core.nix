 { config,pkgs, ...}:
 {  
   imports = [ ./hardware-configuration.nix ];
  


   boot.loader.grub.enable = true;
   boot.loader.grub.device = "/dev/vda";

  
   networking.hostName = "cloud-core";
   networking.useDHCP = false;

   networking.interfaces.eth0.ipv4.addresses = [
                                 {
                                    address = "167.99.50.15";
                                    prefixLength = 20;
                                 }
                                   ];
   networking.defaultGateway = "167.99.48.1";
   networking.firewall.allowedTCPPorts = [ 22 ];
   networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
   

    services.openssh = {
             enable = true;
             settings.PermitRootLogin = "yes";
             settings.PasswordAuthentication = true;
                      };
 nix.settings.experimental-features = [ "nix-command" "flakes" ];

environment.systemPackages = with pkgs; [ fastfetch ];


users.users.root = {
                initialPassword = "Nfsd91a";
                openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4LGh5VDbdRJZPDjhdUAMtFOuM5QCcpo/hJ9l9HbxYQ" ];
                     }; 


users.mutableUsers = true;


  system.stateVersion = "25.11"; 
}
