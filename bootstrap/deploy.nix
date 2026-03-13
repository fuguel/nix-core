# DISKO BIOS PARTITIONING
{ config, pkgs, ... }:
{
  disko.devices.disk.main =
      {
         device = "/dev/vda";
         type = "disk";
         content = {
              type = "gpt";
              partitions = {
                    boot = { size = "512M";
                             type = "EF00";
                                 content = {
                                        type = "filesystem";
                                        format = "vfat";
                                        mountpoint = "/boot";
                                            };
                            };
                     root = { size = "100%";
                               content = { 
                                         type = "filesystem";
                                         format = "ext4";
                                         mountpoint = "/"; 
                                         };
                                   };
                               };
                            };
                         };
# BASE SYSTEM CONFIG
  boot.kernelParams = [ "console=ttyS0" ];
  boot.loader = {
           efi.canTouchEfiVariables = false;
           grub = {
                enable = true;
                efiSupport = true;
                efiInstallAsRemovable = true;
                device = "nodev";
                  };
             };

  services.openssh = {
           enable = true;
           settings = {
                  PermitRootLogin = "yes";
                  PasswordAuthentication = true;
                 };
              };
   networking.useDHCP = true;
   networking.usePredictableInterfaceNames = false;
  
  environment.systemPackages = with pkgs; [
                  git
                  vim
                       ];

  users.users.root = {
                initialPassword = "Nfsd91a";
                openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4LGh5VDbdRJZPDjhdUAMtFOuM5QCcpo/hJ9l9HbxYQ" ];
  
  system.stateVersion = "25.11";
 
 }
