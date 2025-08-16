
.PHONY: switch
switch:
	home-manager switch --flake .#shade --extra-experimental-features nix-command

