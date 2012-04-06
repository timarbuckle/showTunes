tell application "System Events"
    set isRunning to (count of (every process whose bundle identifier is "com.Growl.GrowlHelperApp")) > 0
end tell

if isRunning then
    tell application "iTunes"
        if player state is playing then
            set myTrack to (get name of current track)
            set myAlbum to current stream title
            set myArtist to (get artist of current track)
        else
            set myTrack to "None"
            set myAlbum to "None"
            set myArtist to "None"
        end if
    end tell

    tell application id "com.Growl.GrowlHelperApp"
        register as application �
            "showTunes AppleScript" all notifications {"Track Notification"} �
            default notifications {"Track Notification"} �
            icon of application "Script Editor"

        notify with name �
            "Track Notification" title �
            myArtist description �
            myAlbum application name "showTunes AppleScript"
    end tell
end if
