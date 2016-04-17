set -g tank_runner 1
source (dirname (status -f))/helper.fish
tank_run (dirname (status -f))/test_*.fish
