{ inputs, ... }:

let
  inherit (inputs) nixpkgs home-manager;

  mkHome = {
    modules,
    user ? "alpha",
    stateVersion ? "24.05",
    system ? "x86_64-linux",
  }: home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    modules = [ ./shared ] ++ modules;
    extraSpecialArgs = { inherit inputs user stateVersion; };
  };
in {
  "alpha@kaizen" = mkHome { modules = [ ./alpha/kaizen ]; };
  "alpha@minimo" = mkHome { modules = [ ./alpha/minimo ]; };
}
