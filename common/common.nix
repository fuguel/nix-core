# This is a common configuration file for all hosts

(config, pkgs, inputs, ....);
{
   # Basic System Settings
        time.timeZone = "America/New_York";
        i8n.defaultLocale = "en_US.UTF-8";

   # Global Packages (Every host gets these)
        environment.systemPackages = with pkgs; [
                     git
                     fastfetch 
        ];
   # User Account Configuration
         users.users.nyx = {
         isNormalUser = true;
   # descrition = "Your Name";
         extraGroups = [ "networkmanager" "wheel" "users" ];
         initialPassword = "nixos";
 };
    # Global Home Manager Settins
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.nyx = { home.stateVersion = "24.11";
    # Add user-level settings here that apply to All Hosts
        programs.bash.enable = true;
        };
 };
# Experimental features for Flakes
nix.settings.experimental-features = [ "nix-command" "flakes" ];
system.stateVersion = "24.11";
}   
 
