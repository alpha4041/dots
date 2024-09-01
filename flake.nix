{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:mic92/sops-nix"; # TODO: Implement this
    disko.url = "github:nix-community/disko";

    nur.url = "github:nix-community/NUR";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    kaizen.url = "github:thericecold/kaizen";
    spicetify-nix.url = "github:gerg-l/spicetify-nix";
 };

  outputs = inputs @ { ... }: {
    homeConfigurations = import ./home { inherit inputs; };
    nixosConfigurations = import ./nixos { inherit inputs; };
  };

  nixConfig = { };
}
