# I like vscodium but I still don't see myself using it over neovim.
{ pkgs, ... }: {

  imports = [ ./user-settings.nix ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix # nix language
      arrterian.nix-env-selector # nix-shell suport

      eamodio.gitlens
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      formulahendry.auto-rename-tag
      streetsidesoftware.code-spell-checker
    ];

    keybindings = [
      {
        key = "ctrl+q";
        command = "editor.action.commentLine";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+s";
        command = "workbench.action.files.saveFiles";
      }
    ];
  };
}
