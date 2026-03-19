$SHELL_GREETING

# Load profile if exists
[[ -f ~/.profile ]] && source ~/.profile

# Paths
export ZSH="$HOME/.oh-my-zsh"

# Install Oh My Zsh if missing
if [ ! -d "$ZSH" ]; then
  echo "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install zsh-autosuggestions plugin if missing
if [ ! -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    "$ZSH/custom/plugins/zsh-autosuggestions"
fi

# Oh My Zsh settings
ZSH_THEME=""   # empty because we use starship
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Your custom shell scripts
source ~/.local/share/shell/fzf-cdf.bash
source ~/.local/share/shell/aliases

# Starship prompt
eval "$(starship init zsh)"