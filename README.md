# Home Manager Configuration

A minimal, terminal-focused, Nix Home Manager setup.

<img width="1488" height="931" alt="image" src="https://github.com/user-attachments/assets/72e3f869-a1a9-45e8-ae1a-dfb35289d8ff" />

## Quick Setup

### Install Nix
```sh
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
. /home/shade/.nix-profile/etc/profile.d/nix.sh
```

### Add Home Manager channel
```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

### Install Home Manager
```sh
nix-shell '<home-manager>' -A install
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
```

### Deploy this configuration
```sh
git clone https://github.com/yourusername/HomeManager.git
cd HomeManager

# Update username and home directory in home.nix first!
# Edit lines 11-12 to match your system:
#   home.username = "yourusername";
#   home.homeDirectory = "/home/yourusername";

# Update Git username and email in ./modules/git.nix

home-manager switch --flake . --extra-experimental-features nix-command
```

## Customization

1. **Packages**: Add/remove packages in `home.nix`. Package configurations are in `modules/package.nix`.

2. **Alacritty**: Modify colors, fonts, and shortcuts in `modules/alacritty.nix`.

3. **Zellij**: Change theme in `modules/zellij.nix`. Note: tmux shortcut changed to `Ctrl + Space` (instead of default `Ctrl + B`).

4. **Shell**: Configure shortcuts and bashrc in `modules/shell.nix`.

## OpenGL Applications (Non-NixOS Systems)

This setup already includes NixGL wrapping around Applications requiring OpenGL (like Alacritty) are wrapped with:
```nix
(config.lib.nixGL.wrap pkgs.alacritty)
```

with NiXGL support added in `flake.nix`:
```nix
nixGL.packages = nixgl;
nixGL.defaultWrapper = "mesa";
nixGL.offloadWrapper = "nvidiaPrime";
nixGL.installScripts = [ "mesa" "nvidiaPrime" ];
```

If you encounter display errors like:
```
Error: Error { raw_code: None, raw_os_message: None, kind: NotSupported("provided display handle is not supported") }
```

Then make sure to 1) identify the package causing the issue and 2) wrap NixGL around it like alacritty above.

For one-off runs of OpenGL applications without Home Manager (to verify):
```bash
nix --extra-experimental-features "nix-command flakes" run --impure github:nix-community/nixGL -- alacritty
```
