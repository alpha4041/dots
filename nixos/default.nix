{ inputs, ... }:

let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (inputs.disko.nixosModules) disko;
  inherit (inputs.sops-nix.nixosModules) sops;

  mkHost = {
    modules,
    stateVersion ? "24.05",
    system ? "x86_64-linux",
  }: nixosSystem {
    inherit system;
    modules = [ sops disko ./shared ] ++ modules;
    specialArgs = { inherit inputs stateVersion; };
  };
in {
  kaizen = mkHost { modules = [ ./hosts/kaizen ]; };
  minimo = mkHost { modules = [ ./hosts/minimo ]; };
}
