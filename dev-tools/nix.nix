{pkgs, ...}:
{ 
  environment.systemPackagess = with pkgs; [
       nil # LSP
	   nixpkgs-fmt
                   ];
 }