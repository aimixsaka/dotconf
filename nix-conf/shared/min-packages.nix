{
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = lib.attrValues {
    inherit (pkgs)
      ## build
      cmake
      pkg-config

      ## editor
      neovim
      emacs

      ## text
      jq
      ripgrep

      ## term
      alacritty
      git
      tmux
      fzf
      tree
      wget
      htop
      parallel

      gdb

      pciutils
      ;
  };
}
