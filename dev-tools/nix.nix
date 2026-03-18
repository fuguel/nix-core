{pkgs, ...}:
{ 
  environment.systemPackages = with pkgs; [
       nil # LSP
	   nixpkgs-fmt
                   ];
 }
