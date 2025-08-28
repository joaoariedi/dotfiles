neofetch

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zhistory

. "$HOME/.asdf/asdf.sh"

# Add Heroku CLI to PATH
export PATH="$HOME/.asdf/installs/nodejs/23.6.0/bin:$PATH"

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init --cmd cd zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh

# Claude settings
export CLAUDE_CODE_OAUTH_TOKEN="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"

alias exa="exa --icons -lh --group-directories-first"
alias exaa="exa -a"
alias zj="zellij --config $HOME/.config/zellij/config.kdl"
alias dc='docker compose'
alias lz='lazygit'
alias wifi='nmcli d w'
alias k='kubectl'
alias s='kitty +kitten ssh'
alias lla='ollama run llama3.1'
alias exn-on="sudo tailscale set --exit-node='exitserver' --exit-node-allow-lan-access=true"
alias exn-off="sudo tailscale set --exit-node="
alias ts='tailscale status'
alias changemac='sudo ifconfig wlp0s20f3 down && sudo macchanger -r wlp0s20f3 && sudo ifconfig wlp0s20f3 up'
alias ipw='ip addr show wlp0s20f3'
alias phone='scrcpy -GS --power-off-on-close'
alias sysls='systemctl list-units --type=service --all | grep '
alias shared-on="sudo mount 100.114.90.6:/home/ariedi/shared ~/Shared"
alias shared-off="sudo umount ~/Shared"
alias compress="gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH"
alias sd='shutdown now'
alias gf='git fetch --all'

# Use modern completion system
autoload -Uz compinit
compinit

