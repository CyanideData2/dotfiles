if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/daniel/.local/share/coursier/bin"
# <<< coursier install directory <<<

set -gx PATH "$PATH:/home/daniel/.cache/scalacli/local-repo/bin/scala-cli"

alias vim="nvim"
alias vimp="nvim -c\"set rtp+=.\""
# alias cdf="cd \$(find . -type d -print | fzf)"
alias cdv="cd ~/V;cd \$(find . -type d -print | fzf)"
alias vimv="cd ~/V;nvim \$(find . -print | fzf)"

alias btreboot="sudo rmmod btusb && sudo rmmod btintel && sudo modprobe btintel && sudo modprobe btusb"

zoxide init fish --cmd cd | source

fish_add_path /home/daniel/.spicetify
