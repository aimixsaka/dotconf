{
  description = "aimi flake config for macos";

  outputs =
    inputs:
    inputs.parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-darwin"
        "x86_64-linux"
      ];
      imports = [
        ./modules/parts
        ./overlays
        ./hosts
        ./users
      ];

      ### -- expose self flake modules to others
      flake.flakeModule = ./modules/parts;
    };

  inputs = {
    ### -- nix lang & nixpkgs help
    parts.url = "github:hercules-ci/flake-parts";
    nix-index-database.url = "github:nix-community/nix-index-database";

    ### -- nixpkgs
    master.url = "github:nixos/nixpkgs/master";
    stable.url = "github:nixos/nixpkgs/release-24.05";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nur.url = "github:nix-community/NUR";
    # emacs-macport for x86_64-darwin broken after this commit
    pkgs-emacs-macport.url = "github:nixos/nixpkgs/038fb464fcfa79b4f08131b07f2d8c9a6bcc4160";

    # Default Nixpkgs for packages and modules
    nixpkgs.follows = "master";

    ### -- overlays
    emacs-overlays.url = "github:nix-community/emacs-overlay";

    ### -- platform support
    darwin.url = "github:LnL7/nix-darwin";
    home.url = "github:nix-community/home-manager";

    ### -- install tools
    disko.url = "github:nix-community/disko";
    nixos-facter-modules.url = "github:numtide/nixos-facter-modules";

    # Minimize duplicate instances of inputs
    nix.inputs.nixpkgs.follows = "nixpkgs";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home.inputs.nixpkgs.follows = "nixpkgs";
    emacs-overlays.inputs.nixpkgs.follows = "nixpkgs";
  };
}
