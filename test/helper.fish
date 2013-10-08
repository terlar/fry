set -l test_path (dirname (status -f))

set -g fry_rubies $test_path/tmp
set -g fry_auto_switch 0

source $test_path/tank.fish
source $test_path/../share/fry/fry.fish
