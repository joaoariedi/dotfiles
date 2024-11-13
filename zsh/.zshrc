neofetch

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zhistory

# Use modern completion system
autoload -Uz compinit
compinit

. "$HOME/.asdf/asdf.sh"

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/themes/catppuccin_mocha.omp.json)"
# eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/catppuccin_mocha.omp.json')"
eval "$(direnv hook zsh)"
eval "$(zoxide init --cmd cd zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh

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
