{ config, pkgs, ... }:

{
   virtualisation.libvirtd = {
     enable = true;
          qemu = {
             package = pkgs.qemu_kvm;
             runAsRoot = true;
             ovmf.packages = [ pkgs.OVMFFull.fd ];
                 };
             };


environment.systemPackages = with pkgs; [ libvirt virt-viewer qemu_kvm ];

}
