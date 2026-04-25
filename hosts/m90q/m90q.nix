{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../common/common.nix
      ../../modules/xfce
    ];
      home-manager.users.nyx = {
      home.stateVersion = "25.11";
    imports = [
      ../../modules/neovim/home.nix
      ];
                           };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "m90q"; 
  networking.networkmanager.enable = true;

  
users.users.root = {
                initialPassword = "nixos";
                openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4LGh5VDbdRJZPDjhdUAMtFOuM5QCcpo/hJ9l9HbxYQ" ];
                   }; 

  users.mutableUsers = true;
  
  
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];


   services.openssh = {
        enable = true;
        settings.PermitRootLogin = "yes";
        settings.PasswordAuthentication = true;
                  };


nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  system.stateVersion = "25.11"; 

}

