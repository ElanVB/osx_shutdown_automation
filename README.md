# Applescript code to automate the shutting down procedure of a OSX system
## Usage
These scripts must be run using the `osascript` command. For example, to run the
script that shuts down your system after 10 minutes enter the following command
in terminal:

`osascript fixed_delay_shutdown.scpt`


To make this easier to use, one could add an alias in your `.bash_profile`.


It is convenient to add this to your cron jobs so that this runs automatically
at preset times. Remember that you cannot use the root symbol (`~`) in the path
for the scripts in your cron jobs. For example, one could put the following line
in your cron jobs file (imagine your username is 'someuser'):

`50 23 * * * osascript /Users/someuser/Desktop/fixed_delay_shutdown.scpt`
