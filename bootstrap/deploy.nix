# DISKO BIOS PARTITIONING
{ config, pkgs, lib, ... }:
{
  disko.devices.disk.main =
      {
         device = "/dev/vda";
         type = "disk";
         content = {
              type = "gpt";
              partitions = {
                    boot = { size = "1M"; type = "EF02"; };
                    root = { size = "100%";

                    content = { 
                           type = "filesystem";
                           format = "ext4";
                           mountpoint = "/"; };
                              };
                            };
                          };
                        };
# BASE SYSTEM CONFIG
  boot.loader.grub = { enable = true; devices = lib.mkForce [ "/dev/vda" ]; efiSupport = false; };
  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4LGh5VDbdRJZPDjhdUAMtFOuM5QCcpo/hJ9l9HbxYQ" ];

  system.stateVersion = "25.11";
  }
