# GBOOK LAPTOP HOST

{ config, lib, pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../common/common.nix
      ../../modules/hyprland
      ../../modules/distrobox
    ];
       home-manager.users.nyx = {
       home.stateVersion = "25.11";
   imports = [
      ../../modules/hyprland/home.nix
      ../../modules/neovim/home.nix      
    ];
                                };


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModulePackages = [ config.boot.kernelPackages.xpadneo ];
  hardware.steam-hardware.enable = true;

  hardware.graphics = {
         enable = true;
         enable32Bit = true;
                     };
 


  networking.hostName = "gbook"; 
  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
  # Configure network proxy if necessary
  # Select internationalisation properties.
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };
  # Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  hardware.bluetooth.enable = true;
  system.stateVersion = "25.11"; 
 }

