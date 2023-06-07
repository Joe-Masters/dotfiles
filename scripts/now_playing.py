#! /usr/bin/python
"""Get media now playing status from dbus."""
import dbus

MUSIC = ""
PLAY = ""
PAUSE = ""

PLAYER = "org.mpris.MediaPlayer2"
PROPERTIES = "org.freedesktop.DBus.Properties"

def get_player_from_services(service_list):
    player = None
    potential_player = None
    player_path = f"/{PLAYER.replace('.', '/')}"
    for service in service_list:
        if service.startswith(PLAYER):
            player = dbus.SessionBus().get_object(service, player_path)
            # Check is player is in use to cover case where multiple players are open
            current_state = get_playback_status(player)
            if current_state.lower() == "playing":
                break
            if current_state.lower() == "paused":
                potential_player = player
            if current_state.lower() == "stopped":
                player = None
    # Show a paused player in favour of nothing at all
    if potential_player and not player:
        player = potential_player
    return player

def get_player():
    bus = dbus.SessionBus()
    services = bus.list_names()
    player = get_player_from_services(services) if services else None
    return player

def get_playback_status(player) -> str:
   return player.Get(
            f"{PLAYER}.Player",
            "PlaybackStatus",
            dbus_interface=PROPERTIES,
        ) 

def get_status_icon(player):
    icon_lookup = {
                "Playing" : PLAY,
                "Paused" : PAUSE,
            }
    status = get_playback_status(player)
    icon = icon_lookup.get(status.title(), "")
    return icon

def get_artist_and_song(player):
    metadata = player.Get(
            f"{PLAYER}.Player",
            "Metadata",
            dbus_interface=PROPERTIES,
        )
    artist = str(metadata.get("xesam:artist", [""])[0])
    song = str(metadata.get("xesam:title", ""))
    return artist, song

def main():
    player = get_player()
    if not player:
        print("ﱙ")
        return
    status_icon = get_status_icon(player)
    artist, song = get_artist_and_song(player)
    if artist and song:
        print(f"{MUSIC} {status_icon} {song} - {artist}")
    else:
        print("ﱙ")

if __name__ == "__main__":
    main()
