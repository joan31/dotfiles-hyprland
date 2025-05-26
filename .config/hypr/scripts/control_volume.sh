#!/usr/bin/env bash
# Usage:
# ./control_volume.sh mute
# ./control_volume.sh raise <value>
# ./control_volume.sh lower <value> 

# Global variables
KEY="$1"
VOLUME="$2"
MAX_VOLUME="1"
AUDIO_SOURCE="@DEFAULT_AUDIO_SINK@"

# Critera notification app-name define in mako config
NOTIF_APPNAME="control_volume"

MUTED_ICON=""
LOW_ICON=""
MEDIUM_ICON=""
HIGH_ICON=""

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

# Function to display popup with volume status
popupStatus () {
	local rawVolumeStatus="$(wpctl get-volume "$AUDIO_SOURCE")"
	local volumeStatus="$(awk -F '[][]' '{print $2}' <<< "$rawVolumeStatus")"
	
	if [[ "$volumeStatus" == MUTED ]]
	then
		notify-send -a "$NOTIF_APPNAME" "${MUTED_ICON}  Muted"
	else
		local levelVolumeGlobal="$(awk '{printf "%.0f\n", $2 * 100}' <<< "$rawVolumeStatus")"
		local iconVolumeGlobal="$(setIconVolume "$levelVolumeGlobal")"
			
		notify-send -a "$NOTIF_APPNAME" "$iconVolumeGlobal  ${levelVolumeGlobal}%"
	fi
}

# Function to set the right state of the volume icon
setIconVolume () {
	local valueVolume="$1"
	local iconVolume
	
	# Low 0-32 / Medium 33-65 / High *
	case "$valueVolume" in
		[0-9]|1[0-9]|2[0-9]|3[0-2]) iconVolume="$LOW_ICON" ;;
		3[3-9]|4[0-9]|5[0-9]|6[0-5]) iconVolume="$MEDIUM_ICON" ;;
		*) iconVolume="$HIGH_ICON" ;;
	esac
	echo "$iconVolume"
}

# Main
case "$KEY" in
	mute)
		muteVolume
		popupStatus
		;;
	raise)
		[[ -z "$VOLUME" ]] && { echo "Missing volume value"; exit 1; }
		unmuteVolume
		raiseVolume
		popupStatus
		;;
	lower)
		[[ -z "$VOLUME" ]] && { echo "Missing volume value"; exit 1; }
		unmuteVolume
		lowerVolume
		popupStatus
		;;
	*)
		echo "Usage: $0 [mute|raise <val>|lower <val>]"
		exit 1
		;;
esac
