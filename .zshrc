# Interactive TTY1 prompt to launch Hyprland or stay in shell
menu_start() {
	if [[ "$XDG_VTNR" == "1" && -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" ]]; then
		trap '' SIGINT  # Disable Ctrl+C

		while true; do
			clear
			echo
			echo "┌─────────────────────────────┐"
			echo "│ Start graphical session ?   │"
			echo "│ [H]yprland  [S]hell         │"
			echo "└─────────────────────────────┘"
			read -k1 "choice?Enter your choice: "
			if [[ $? -ne 0 ]]; then
				echo
				echo "CTRL+D is disabled. Press H or S."
				sleep 2 
				continue
			fi
			echo

			case $choice in
				h|H)
					echo "-> Launching Hyprland..."
					exec hyprland
					;;
				s|S|'')
					echo "-> Staying in shell."
					echo "[i] To launch Hyprland manually, type: hyprland"
					break
					;;
				*)
					echo "[x] Invalid input. Press H or S."
					sleep 2
					;;
			esac
		done

		trap - SIGINT  # Re-enable Ctrl+C
	fi
}

# Common shell setup
common_setup() {
	# Path to oh-my-zsh installation
	export ZSH="$HOME/.local/share/oh-my-zsh"

	# Enable timestamp in command history (visible with `history`)
	HIST_STAMPS="yyyy-mm-dd"
}

# Setup for graphical shell
setup_graphical_shell() {
	# Show system info
	fastfetch

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

	# Load Powerlevel10k configuration if present or to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
}

# Setup for TTY shell
setup_tty_shell() {
	# Use a lightweight theme for TTY environments
	ZSH_THEME="philips"

	# Load minimal plugins in TTY
	plugins=(archlinux git)

	# Aliases
}

# Main
menu_start  # Optional graphical prompt on TTY1
common_setup  # Shared settings

if [[ "$TERM" == "linux" ]]; then
	setup_tty_shell
else
	setup_graphical_shell
fi

# Initialize oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

# Custom aliases
source "$HOME/.zsh_aliases"
