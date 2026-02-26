{ pkgs, ... }:
{
  home.packages = with pkgs; [
            yazi
            chafa
            ffmpegthumbnailer
            poppler
            wl-clipboard
            unzip
            p7zip
                          ];
}
