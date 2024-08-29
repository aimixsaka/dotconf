{ lib, pkgs, ... }:

{
  environment.systemPackages =
    with pkgs;
    lib.flatten (
      lib.attrValues {
        build = [ 
          cmake
          pkg-config 
        ];

        editor = [
          neovim
        ];

        text = [
          jq
          #ripgrep-all
          ripgrep
        ];

        term = [
          alacritty
          tmux
          fzf
          tree
          wget
          stow
          btop
          trash-cli
          pandoc
          parallel
          git-filter-repo

          home-manager
          podman
          
          gdb
        ];

        net = [];

        db = [ sqlite ];

        app = [
          vscode
          #! notify-osd do not support mac x86_64
          #nyxt

          qemu
          # FIXME: failed to download because of network issue
          #realvnc-vnc-viewer
        ];

        languages = [
          python3
          pdm

          go
          rustup
          zig
          # haskell
          ghc
          # scheme
          racket
          guile
          # common lisp
          sbcl

          nodePackages_latest.nodejs
          nodePackages_latest.npm
          # java
          ## use brew to manage jdk instead
          #jdk8
          #jdk11
        ];

        fonts = [ ];

        lsp = [ nil zls pyright ];
      }
    );
}
