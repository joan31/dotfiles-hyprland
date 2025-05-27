if [[ "$TERM" != 'linux' ]]
then
	fastfetch

	# Enable Powerlevel10k instant prompt
	if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
		source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi

	# Path oh-my-zsh installation
	export ZSH="$HOME/.local/share/oh-my-zsh"

	# Theme
	ZSH_THEME="powerlevel10k/powerlevel10k"

	# Command execution time stamp shown in the history command output
	HIST_STAMPS="yyyy-mm-dd"

	# Additional completion definitions (zsh-completions plugin)
	fpath+=${ZSH_CUSTOM:-${ZSH:-~/.local/share/oh-my-zsh}/custom}/plugins/zsh-completions/src

	plugins=(archlinux git zsh-autosuggestions zsh-syntax-highlighting)

	source $ZSH/oh-my-zsh.sh

	# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

	# Aliases
	alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
else
	# Path oh-my-zsh installation
	export ZSH="$HOME/.local/share/oh-my-zsh"

	# Theme
	ZSH_THEME="philips"

	# Command execution time stamp shown in the history command output
	HIST_STAMPS="yyyy-mm-dd"

	plugins=(archlinux git)

	source $ZSH/oh-my-zsh.sh

	# Aliases
	alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
	alias nvim="XDG_CONFIG_HOME= /usr/bin/nvim"
fi
