{ config, pkgs, ...}:
{
    virtualisation.libvirt.connections."qemu:///system".domains = [
               {
                  definition = pkgs.writeText "xclarity-admin.xml"
                      ''
                          <domain type ='kvm'>
                                 <name>xclarity-administrator</name>
                                 <memory unit='GiB'>6</memory>
                                 <vcpu placement='static'>4</vcpu>
                              <os>
                                 <type arch='x86_64' machine='q35'>hvm</type>
                              </os>
                              <devices>
                                 <disk type='file' device='disk'>
                                    <driver name='qemu' type='qcow2' cache='writeback'/>
                                    <source file='/var/lib/libvirt/images/clarity.qcow2'/>
                                    <target dev='vda' bus='virtio'/>
                                 </disk>
                                <interface type='bridge'>
                                    <source bridge='br0'/>
                                    <model type='virtio'/>
                                </interface>
                                <console type='pty'>
                                      <target type='serial' port='0'/>
                                </console>
                                <graphics type='spice' autoport='yes'/>
                              </devices>
                           </domain>
                        '';
                  }
                                                                    ];
  }

