{ pkgs, ... }:
{
   home.packages = with pkgs; [
      hyprland
      waybar
      wofi
      rot8 
];
home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
