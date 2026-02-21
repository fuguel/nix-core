{ pkgs, ... }:
{
   home.packages = with pkgs; [
      hyprland
      waybar
      wofi
     ];
home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
