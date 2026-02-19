# Start of the Main Flake

 { description = " Nix-Core Infratructure";
# External Dependicies Inputs
# Standard NixOs Packages
  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
# User-level Configuration Tool, Keep HomeManager on same version as system
  home-manager = { url = "github:nix-community/home-manager;
                  inputs.nixpkgs.follows = "nixpkgs";
                 };
  };

# What this flake produces Outputs
  outputs = { self, nixpkgs, home-manager, ...}@inputs: 
            { nixosConfigurations = { gbook = nixpkgs.lib.nixosSystem
                                    { system = "x86_64-linux";
                      specialArgs = { inherit inputs; };
                                     
             modules = [ ./hosts/gbook/galaxy.nix
                          home-manager.nixosModules.home-manager 
                       ];
           };
        };
    };
  }




