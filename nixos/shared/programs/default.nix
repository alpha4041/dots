{ lib, pkgs, ... }: {

  environment = {
    variables.EDITOR = "neovim";
    systemPackages = with pkgs; [
      lsof wget gnumake
      unrar unzip p7zip
      home-manager nix-output-monitor
      kitty
    ];
  };

  programs = {
    adb.enable = true;
    git.enable = true;
    light.enable = true;
    dconf.enable = true;
    nano.enable = true;
    less.enable = lib.mkDefault false; # I'd rather use bat

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    nh = {
      enable = true;
      flake = "/home/alpha/dots";
    };

    bash = import ./bash.nix;
  };
}
