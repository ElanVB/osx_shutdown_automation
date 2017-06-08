-- Set time to wait before shutdown in seconds
set shutdown_delay_minutes to 1
set shutdown_delay to shutdown_delay_minutes * 60
set quit_apps to true
set WHITE_LIST to {"Finder", "Terminal", "Atom"}
set force_with_shell to true

-- Notify user that the system will shutdown
set notification_text to "Shutting down in " & shutdown_delay_minutes & " mins"
display notification notification_text sound name "default"
do shell script ("say '" & notification_text & "'")

-- Use the shell shutdown command to force shutdown if app interferes
if force_with_shell then
    do shell script ("shutdown -h +" & (shutdown_delay_minutes + 5) & " > /dev/null 2>&1 &")
end if

-- Wait for the appropriate amount of time
delay shutdown_delay

-- Attempt to close all apps before shutdown
if quit_apps then
    tell application "System Events"
        set open_apps to name of every application process whose visible is true
        repeat with open_app in open_apps
            if not WHITE_LIST contains open_app
                quit application open_app saving no
            end if
        end repeat
    end tell
end if

-- Do not let applications prevent shutdown
ignoring application responses
    -- Shut the system down
    tell application "System Events" to shut down
end ignoring
