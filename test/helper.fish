set -xg tank_reporter spec

set -xg test_path $PATH

set -xg fry_rubies $PWD/dummy-rubies
set -xg fry_auto_switch 0

. ../share/fry/fry.fish

function setup_tank; return; end
function clean_tank; return; end
