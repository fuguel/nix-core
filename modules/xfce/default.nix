{ config, pkgs, ... }:
{
     services.xserver = {
                enable = true;
                videoDrivers = [ "intel" ];
                displayManager.lightdm.enable = true;
                desktopManager.xfce.enable = true;
                };
   
  environment.systemPackages = with pkgs; [ brave ];
  services.displayManager.defaultSession = "xfce";
  
}
                     
