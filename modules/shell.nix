{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;

    shellAliases = {
      cd = "z";
      ls = "eza --icons --group-directories-first";
      ll = "eza -la --icons --group-directories-first";
      la = "eza -a --icons --group-directories-first";
      tree = "eza --tree --icons";
      zi = "z -i";  # Interactive zoxide
    };

    bashrcExtra = ''
      # Simple, clean prompt with current directory path
      export PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '

      # Better history settings
      export HISTSIZE=10000
      export HISTFILESIZE=10000
      export HISTCONTROL=ignoredups:erasedups
      shopt -s histappend

      # Menu-style tab completion with TAB navigation
      bind 'set completion-ignore-case on'
      bind 'set show-all-if-ambiguous on'
      bind 'set menu-complete-display-prefix on'
      bind 'TAB:menu-complete'
      bind 'set colored-completion-prefix on'
      bind 'set colored-stats on'
      bind 'set visible-stats on'
      bind 'set mark-symlinked-directories on'
      bind 'set show-all-if-unmodified on'

      # Use Shift+Tab to go backwards in menu
      bind '"\e[Z":menu-complete-backward'

      # Append system DRI dir so libva can find nvidia_drv_video.so
      # (nixGL's LIBVA_DRIVERS_PATH only covers mesa + intel-media-driver)
      export LIBVA_DRIVERS_PATH="$LIBVA_DRIVERS_PATH:/usr/lib64/dri"

      # User specific environment
      if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
          PATH="$HOME/.local/bin:$HOME/bin:$PATH"
      fi
      # Check if .npm-global exists, if so add it as part of the PATH.
      [ -d "$HOME/.npm-global/bin" ] && PATH="$HOME/.npm-global/bin:$PATH"
      # Check if .nix-profile exists, if so add it as part of the PATH.
      [ -d "$HOME/.nix-profile/bin" ] && PATH="$HOME/.nix-profile/bin:$PATH"
      # Check if go local directory exists, if so add it as part of the PATH.
      [ -d "$HOME/go/bin" ] && PATH="$HOME/go/bin:$PATH"
      export PATH
      # Check if go exists, if so add it as part of the PATH.
      [ -d "$HOME/go/bin" ] && PATH="$HOME/go/bin:$PATH"
      export PATH
      # Check if rust cargo folder exists, if so add it as part of the PATH.
      [ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH" && source "$HOME/.cargo/env"
      export PATH

      ## Sources

      # Does nvm exist? then source it
      [ -f "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"


    '';
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };
}