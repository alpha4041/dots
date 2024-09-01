{
  programs.vscode.userSettings = {
    update.mode = "none";

    extensions = {
      autoUpdate = false;
    };

    window = {
      titleBarStyle = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509
      menuBarVisibility = "toggle";
    };

    editor = {
      fontSize = 16;
      formatOnType = true;
      fontLigatures = true;
      mouseWheelZoom = true;
      minimap.enabled = false;
      renderControlCharacters = false;
      fontFamily = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";

      scrollbar = {
        vertical = "hidden";
        horizontal = "hidden";
        verticalScrollbarSize = 2;
        horizontalScrollbarSize = 2;
      };
    };

    workbench = {
      startupEditor = "none";
      layoutControl.type = "menu";
      iconTheme = "catppuccin-mocha";
      colorTheme = "Catppuccin Mocha";
      editor = {
        limit = {
          value = 5;
          enabled = true;
          perEditorGroup = true;
        };
        showTabs = "single";
      };
      activityBar.location = "hidden";
      statusBar.visible = false;
      layoutControl.enabled = false;
    };

    explorer = {
      openEditors.visible = 0;
      confirmDragAndDrop = false;
    };

    terminal.integrated.fontFamily = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont'";

    "breadcrumbs.enabled" = false;
    "files.autoSave" = "onWindowChange";
    "vsicons.dontShowNewVersionMessage" = true;

    vim = {
      easymotion = true;
      incsearch = true;
      useSystemClipboard = true;
      useCtrlKeys = true;
      hlsearch = true;
      insertModeKeyBindings = [
        {
          before = ["j" "j"];
          after = ["<Esc>"];
        }
      ];

      leader =  "<space>";
      handleKeys = {
        "<C-a>" = false;
        "<C-f>" = false;
      };
    };

    editor.defaultFormatter = "esbenp.prettier-vscode";
    "[javascript]".editor.defaultFormatter = "esbenp.prettier-vscode";
  };
}
