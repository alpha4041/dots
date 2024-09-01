{ pkgs, ... }: {
  imports = [
    ./helix
  ];

  home.packages =
    with pkgs;
    with nodePackages;
    with python311Packages; [
    clang go # Compilers
    python3 pip pipx # Python3
    distrobox
    podman-tui 
    podman-compose 
  ];
}
