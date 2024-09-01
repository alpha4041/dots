{ pkgs, ... }:
{
  home.sessionVariables.COLORTERM = "truecolor";
  programs.helix = {
    enable = true;
    languages = import ./languages.nix pkgs;

    settings = {
      theme = "poimandres";
      keys = import ./keys.nix;
      editor = import ./editor.nix;
    };
  };
}
