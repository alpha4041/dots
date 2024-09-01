{ pkgs, ... }: {
  imports = [ ./sysfetch ];

  programs.neomutt = {
    # TODO: Set this up
    enable = true;
    vimKeys = true;
  };

  home.packages = with pkgs; [
    # Just fun stuff
    pipes-rs  # Animated pipes
    lsix      # Shows thumbnails in terminal using sixel

    # Game
    vitetris
  ];
}
