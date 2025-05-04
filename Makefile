.PHONY: rebuild update format clean-garbage

rebuild:
	sudo nixos-rebuild switch

update:
	nix flake update

format:
	nixfmt *

clean-garbage:
	nix-collect-garbage