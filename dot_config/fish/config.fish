# Print logo
set fish_greeting # Suppress default greeting
fish_logo cyan blue white

function setenv; set -gx $argv; end
source /home/alex/.env_vars
