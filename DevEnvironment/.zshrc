if [[ ! -f ~/.antigen/antigen/antigen.zsh ]]; then
  git clone --branch master https://github.com/zsh-users/antigen.git "$HOME/.antigen/antigen"
fi

# Load Powerlevel10k prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Antigen Configuration #######################################################
# Initialize antigen, load OMZ and powerlevel10k.
source "$HOME/.antigen/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k

antigen bundles <<EOBUNDLES
  # Load internal plugins.
  command-not-found
  fzf
  git
  gpg-agent
  nvm
  ssh-agent
  thefuck
  vscode
  zsh-interactive-cd

  # Load external plugins.
  MichaelAquilina/zsh-you-should-use
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting # Always put at the end.
EOBUNDLES

# Plugin Settings
export NVM_AUTOLOAD=1
export YSU_HARDCORE=1

# Apply everything.
antigen apply

# Custom Configuration ########################################################
# Load Powerlevel10k prompt.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Fully upgrade the system.
alias upgrade="sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y"

# Colorls
unalias l; unalias la; unalias ll; unalias ls; unalias lsa
source $(dirname $(gem which colorls))/tab_complete.sh
alias ls="colorls --gs" # Color replacement for ls.
alias la="ls -A --sd" # Simple list all.
alias li="ls -al --sd" # Detailed list all.
alias lf="ls -Af1" # Simple list all files.
alias ld="ls -Ad1" # Simple list all directories.
alias tree="ls --tree" # Replacement for tree.

# To handle *.tar.7z because I'll never remember this.
# 'tar7z a dirName' to compress & 'tar7z e fileName' to extract.
t7z() {
  if [ "$1" = "a" ]; then
    tar cf - $2 | 7z a -si $2.tar.7z
  elif [ "$1" = "e" ]; then
    7z e -so $2.tar.7z | tar xf -
  else
    echo "Not a valid value. Please use 'a' or 'e'."
  fi
}
