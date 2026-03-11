# DISKO BIOS PARTITIONING
{ config, pkgs, ... }:
{
  disko.devices.disk.main =
      {
         device = "/dev/vda";
         type = "disk";
         content = {
              type = "table";
              format = "msdos";
              partitions = [
                {
                    name = "root";
                    start = "1MiB";
                    end = "100%";
                    bootable = true;
                    content = { 
                           type = "filesystem";
                           format = "ext4";
                           mountpoint = "/"; };
                              }
                          ];
                        };
                      };
# BASE SYSTEM CONFIG
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  services.openssh.enable = true;

  users.users.root.openssh.authorized.keys = [ "ssh-ed25519 yourpublickey"  ];
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4LGh5VDbdRJZPDjhdUAMtFOuM5QCcpo/hJ9l9HbxYQ nyx@nixos

  system.stateVersion = "25.11";
  }
