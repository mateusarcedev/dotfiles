# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew prefix, resolved once. Plugins below are skipped if missing.
if (( $+commands[brew] )); then
  BREW_PREFIX="$(brew --prefix)"
fi

[[ -r "$BREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme" ]] && source "$BREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# History Setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=1200
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space  # commands starting with a space (e.g. exporting tokens) are not saved
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

[[ -r "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

if (( $+commands[eza] )); then
  alias ls="eza --color=auto --icons=auto"
  alias ll="eza --color=auto --icons=auto --long --no-filesize --no-time --no-permissions"
fi

# `cd` falls back to zoxide only when the literal path does not exist.
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh --cmd cd)"
fi

# Machine-specific settings and secrets (not versioned).
[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local

# Must be sourced last.
[[ -r "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
