zimfw() { source /home/cn/.zim/zimfw.zsh "${@}" }
zmodule() { source /home/cn/.zim/zimfw.zsh "${@}" }
typeset -g _zim_fpath=(/home/cn/.dotfiles/zim/.zim/modules/git/functions /home/cn/.dotfiles/zim/.zim/modules/utility/functions /home/cn/.dotfiles/zim/.zim/modules/duration-info/functions /home/cn/.dotfiles/zim/.zim/modules/git-info/functions)
fpath=(${_zim_fpath} ${fpath})
autoload -Uz -- git-alias-lookup git-branch-current git-branch-delete-interactive git-branch-remote-tracking git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw duration-info-precmd duration-info-preexec coalesce git-action git-info
source /home/cn/.dotfiles/zim/.zim/modules/environment/init.zsh
source /home/cn/.dotfiles/zim/.zim/modules/git/init.zsh
source /home/cn/.dotfiles/zim/.zim/modules/input/init.zsh
source /home/cn/.dotfiles/zim/.zim/modules/termtitle/init.zsh
source /home/cn/.dotfiles/zim/.zim/modules/utility/init.zsh
source /home/cn/.dotfiles/zim/.zim/modules/duration-info/init.zsh
source /home/cn/.dotfiles/zim/.zim/modules/asciiship/asciiship.zsh-theme
source /home/cn/.dotfiles/zim/.zim/modules/zsh-completions/zsh-completions.plugin.zsh
source /home/cn/.dotfiles/zim/.zim/modules/completion/init.zsh
source /home/cn/.dotfiles/zim/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/cn/.dotfiles/zim/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/cn/.dotfiles/zim/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/cn/.dotfiles/zim/.zim/modules/powerlevel10k/powerlevel10k.zsh-theme
