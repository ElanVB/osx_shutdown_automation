-- Set time to wait before shutdown in seconds
set shutdown_delay to 10 * 60
set quit_apps to true
set WHITE_LIST to {"Finder", "Terminal", "Atom"}

-- Notify user that the system will shutdown
display notification "shutting down in " & shutdown_delay & " seconds"

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
