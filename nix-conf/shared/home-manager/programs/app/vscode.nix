{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      # nix
      vscode-extensions.bbenoist.nix
      # python
      vscode-extensions.ms-python.python
      vscode-extensions.ms-python.vscode-pylance
      # neovim
      vscode-extensions.asvetliakov.vscode-neovim
      # bash
      vscode-extensions.timonwong.shellcheck
    ];
    userSettings = {
      "editor.fontSize" = 18;
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-neovim" = 1;
      };
      "files.autoSave" = "afterDelay";
      "security.workspace.trust.untrustedFiles" = "open";
      "workbench.colorTheme" = "One Dark Pro Darker";
    };
  };
}
