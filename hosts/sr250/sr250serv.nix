{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../common/common.nix
      ../../services/prometheus
   ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; 
  boot.initrd.kernelModules = [ "dm-snapshot" "dm-mirror" "dm-multipath" ];
  
  networking.hostName = "sr250"; 
 
  networking.firewall.allowedTCPPorts = [ 3000 9090 8000 9443 ];

users.users.root = {
                initialPassword = "nixos";
                openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4LGh5VDbdRJZPDjhdUAMtFOuM5QCcpo/hJ9l9HbxYQ" ];
                   }; 

  users.mutableUsers = true;
  networking.networkmanager.enable = true;


  

   services.openssh = {
          enable = true;
          settings.PermitRootLogin = "yes";
          settings.PasswordAuthentication = true;
                      };
        
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11"; 


}
