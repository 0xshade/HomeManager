{ config, pkgs, lib, nixgl, ... }:

{
  nixGL.packages = nixgl;
  nixGL.defaultWrapper = "mesa";
  nixGL.offloadWrapper = "nvidiaPrime";
  nixGL.installScripts = [ "mesa" "nvidiaPrime" ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "shade";
  home.homeDirectory = "/home/shade";

  # This value determines the Home Manager release which your
  # configuration is compatible with. Don't change unless you know what you're doing.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The packages you want to install
  home.packages = with pkgs; [
    # Your essential tools
    # (config.lib.nixGL.wrap pkgs.alacritty)
    zoxide
    eza
    # Fonts
    (pkgs.nerd-fonts.mononoki)
  ];

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # Import modular configurations
  imports = [
    ./modules/alacritty.nix
    ./modules/zellij.nix
    ./modules/shell.nix
    ./modules/git.nix
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}