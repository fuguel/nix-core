{ pkgs, ... }:
{
   home.packages = with pkgs; [
      hyprland
      waybar
      wofi
     ];
home.file.".config/hypr/hyprland.conf".text = ''
monitor=,preferred,auto,1
exec-once = waybar
    '';
}
