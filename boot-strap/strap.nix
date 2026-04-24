# DISKO BIOS PARTITIONING
{ config, pkgs, modulesPath, ... }:
{
   imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

disko.devices.disk.main =
      {
         device = "/dev/nvme0n1";
         type = "disk";
         content = {
              type = "gpt";
              partitions = {
                     ESP = {
                             size = "512M";
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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

 networking.hostName = "m90q";
 networking.useDHCP = true;
  
  services.openssh = {
           enable = true;
           settings = {
                  PermitRootLogin = "yes";
                  PasswordAuthentication = true;
                 };
              };
  
  environment.systemPackages = with pkgs; [
                  git
                  vim
                       ];

  users.users.root = {
                initialPassword = "Nfsd91a";
                openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4LGh5VDbdRJZPDjhdUAMtFOuM5QCcpo/hJ9l9HbxYQ" ];
                     }; 
  system.stateVersion = "25.11";
 
 }
