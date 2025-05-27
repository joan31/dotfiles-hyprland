# Show system info with fastfetch if running under a graphical environment
if [[ -n $DISPLAY || -n $WAYLAND_DISPLAY ]]; then
	fastfetch
fi

# Path to oh-my-zsh installation
export ZSH="$HOME/.local/share/oh-my-zsh"

# Enable timestamp in command history (visible with `history`)
HIST_STAMPS="yyyy-mm-dd"

# Git alias to manage dotfiles using a bare repository setup
if [ -d "$HOME/.dotfiles" ]; then
	alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
fi

# Terminal-specific configuration
if [[ "$TERM" == 'linux' ]]; then
	# Use a lightweight theme for TTY environments
	ZSH_THEME="philips"

	# Load minimal plugins in TTY
	plugins=(archlinux git)

	# Prevent Neovim from reading graphical config paths in TTY
	alias nvim="XDG_CONFIG_HOME= /usr/bin/nvim"
else
	# Enable Powerlevel10k instant prompt for faster shell startup
	if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
		source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi

	# Set Powerlevel10k as the ZSH theme
	ZSH_THEME="powerlevel10k/powerlevel10k"

	# Add zsh-completions to function path (enables extra completions)
	fpath+=${ZSH_CUSTOM:-${ZSH:-~/.local/share/oh-my-zsh}/custom}/plugins/zsh-completions/src

	# Load plugins for development and usability
	plugins=(archlinux git zsh-autosuggestions zsh-syntax-highlighting)

	#  Load Powerlevel10k configuration if present or to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# Initialize oh-my-zsh framework and plugins
source "$ZSH/oh-my-zsh.sh"

# Interactive prompt to optionally launch Hyprland on TTY1
if [[ "$XDG_VTNR" == "1" && -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" ]]; then
	trap '' SIGINT  # Disable Ctrl+C

	while true; do
		clear
		echo
		echo "/─────────────────────────────\\"
		echo "│ Start graphical session ?   │"
		echo "│ [H]yprland  [S]hell         │"
		echo "\\─────────────────────────────/"
		read -k1 "choice?Enter your choice: "
		echo

		case $choice in
			h|H)
				echo "-> Launching Hyprland..."
				exec hyprland
				;;
			s|S|'')
				echo "-> Staying in shell."
				echo "/!\\  To start the window manager manually, type: hyprland"
				break
				;;
			*)
				echo ":( Invalid input. Please press H to start Hyprland or S to stay in shell."
				sleep 2
				;;
		esac
	done

	trap - SIGINT  # Re-enable Ctrl+C
fi
