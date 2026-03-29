{ config, pkgs, ... }:

{
   vitualisation.libvirt = {
     enable = true;
          qemu = {
             package.qemu_kvm;
             runAsRoot = true;
             ovmf.enable = true;
                 };
      };

environment.systemPackages = with pkgs; [ libvirt virt-viewer qemu_kvm ];
