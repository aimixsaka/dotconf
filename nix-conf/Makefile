rebuild:
	@nix run nix-darwin -- switch --flake .#mt
debug:
	@nix run nix-darwin --verbose --debug -- switch --flake .#mt
impure:
	@nix run nix-darwin -- switch --impure --flake .#mt
rb-remote:
	@nix --builders 'ssh://host' run nix-darwin -- switch --flake .#mt

.PHONE: rebuild debug impure
