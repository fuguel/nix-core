# This is a common configuration file for all hosts

{config, pkgs, inputs, ... }:
{
   # Basic System Settings
        system.nixos.label = "Nix-Core";
        time.timeZone = "America/New_York";
        i18n.defaultLocale = "en_US.UTF-8";

   # Global Packages (Every host gets these)
        environment.systemPackages = with pkgs; [
                     git
                     gh
                     fastfetch 
                     kitty
                     glances
                     cage
                     curl
                     tmux
                     qutebrowser
                     
        ];
   # User Account Configuration
         users.users.nyx = {
         isNormalUser = true;
         description = "nyx";
         extraGroups = [ "networkmanager" "wheel" "users" ];
         initialPassword = "nixos";
 };
    # Global Home Manager Settings
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
     # Add user-level settings here that apply to All Hosts
      };
# Experimental features for Flakes
nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
