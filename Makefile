
.PHONY: switch
switch:
	home-manager switch --flake .#shade --extra-experimental-features nix-command --impure

.PHONY: clean
clean:
	nix-collect-garbage -d
