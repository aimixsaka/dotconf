{ lib, pkgs, ... }:

{
  imports = [ ./min-packages.nix ];
  environment.systemPackages = lib.attrValues {
    inherit (pkgs)
      ## term
      podman
      git-filter-repo
      stow
      trash-cli
      ## db
      sqlite

      ## app
      vscode
      pandoc
      qemu

      ## languages
      python3
      pdm
      go
      rustup
      zig
      ghc
      racket
      guile
      sbcl

      ## lsp
      nil
      zls
      pyright
      ;

    inherit (pkgs.nodePackages_latest)
      nodejs
      npm
      ;
  };

}
