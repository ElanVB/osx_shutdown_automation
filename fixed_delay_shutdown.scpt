-- Set time to wait before shutdown in seconds
set shutdown_delay to 10

-- Notify user that the system will shutdown
display notification "shutting down in " & shutdown_delay & " seconds"

-- Wait for the appropriate amount of time
delay shutdown_delay
