{ config, ... }:

let
  ifExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users = {
    groups = { };

    users = {
      alpha = {
        isNormalUser = true;
        initialPassword = "142536"; # TODO: Encrypt password
        extraGroups = [ "wheel" "video" "audio" ] ++ ifExist [
          "kvm"
          "docker"
          "podman"
          "adbusers"
          "libvirtd"
          "networkmanager"
        ];
      };
    };
  };
}
