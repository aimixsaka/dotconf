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
      git
      tmux
      fzf
      tree
      htop
      parallel

      gdb

      pciutils
      ;
  };
}
