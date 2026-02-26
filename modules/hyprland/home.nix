{ pkgs, ... }:
{
   home.packages = with pkgs; [
      hyprland
      waybar
      wofi
      iio-hyprland
      ];
home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
