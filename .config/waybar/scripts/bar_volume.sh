#!/usr/bin/env bash
# Usage:
# ./bar_volume.sh mute
# ./bar_volume.sh raise <value>
# ./bar_volume.sh lower <value>

# Global variables
KEY="$1"
VOLUME="$2"
MAX_VOLUME="1"
AUDIO_SOURCE="@DEFAULT_AUDIO_SINK@"

# Function to mute/unmute
muteVolume () {
	wpctl set-mute "$AUDIO_SOURCE" toggle
}

# Function to unmute when raise/lower volume
unmuteVolume () {
	local volumeStatus="$(wpctl get-volume "$AUDIO_SOURCE" | awk -F '[][]' '{print $2}')"

	if [[ "$volumeStatus" == MUTED ]]
	then
		wpctl set-mute "$AUDIO_SOURCE" 0
	fi
}

# Function to raise volume
raiseVolume () {
	wpctl set-volume -l "$MAX_VOLUME" "$AUDIO_SOURCE" "${VOLUME}%+"
}

# Function to lower volume
lowerVolume () {
	wpctl set-volume "$AUDIO_SOURCE" "${VOLUME}%-"
}

# Main
case "$KEY" in
	mute)
		muteVolume
		;;
	raise)
		[[ -z "$VOLUME" ]] && { echo "Missing volume value"; exit 1; }
		unmuteVolume
		raiseVolume
		;;
	lower)
		[[ -z "$VOLUME" ]] && { echo "Missing volume value"; exit 1; }
		unmuteVolume
		lowerVolume
		;;
	*)
		echo "Usage: $0 [mute|raise <val>|lower <val>]"
		exit 1
		;;
esac
