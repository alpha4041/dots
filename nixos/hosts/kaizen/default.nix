{ config, disk, ... }: {

  imports = [ 
    ./desktop.nix 
    ./services.nix 
    ./hardware-configuration.nix 
  ];

  # disko = import disk;
  networking.hostName = "asus-VB-Pro";

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings.General.Experimental = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  boot = {
    blacklistedKernelModules = [ "k10temp" ];
  };

  # Allow systemd to handle coredumps.
  systemd.coredump.enable = true;
}
