{ inputs, pkgs, ... }:
let
  kaizen = inputs.kaizen.packages.${pkgs.system}.default;
in {
  environment = {
    systemPackages = with pkgs; [ kaizen linux-wifi-hotspot ];

    loginShellInit = /* bash */ ''
      # INFO: If removed, xwayland apps won't work, idk why.
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    '';
  };

  programs = {
    virt-manager.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu.package = pkgs.qemu;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  security.pam.services.ags = {};

  services = {
    gvfs.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = false;
    # greetd = {
    #   enable = true;
    #   settings.default_session.command = pkgs.writeShellScript "greeter" ''
    #     ${inputs.kaizen.packages.${pkgs.system}.default}/bin/greeter
    #   '';
    # };
  };

  # systemd.tmpfiles.rules = [ "d '/var/cache/greeter' - greeter greeter - -" ];

  # system.activationScripts.wallpaper = ''
  #   PATH=$PATH:${pkgs.busybox}/bin:${pkgs.jq}/bin
  #   CACHE="/var/cache/greeter"
  #   OPTS="$CACHE/options.json"
  #   HOME="/home/$(find /home -maxdepth 1 -printf '%f\n' | tail -n 1)"

  #   cp $HOME/.cache/ags/options.json $OPTS
  #   chown greeter:greeter $OPTS

  #   BG=$(cat $OPTS | jq -r '.wallpaper // "$HOME/.config/background.png"')
  #   cp $BG $CACHE/background
  #   chown greeter:greeter $CACHE/background
  # '';
}
