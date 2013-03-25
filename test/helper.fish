set -xg fish_tank /usr/local/share/fish-tank/tank.fish
if not test -e $fish_tank
  set -e fish_tank
  echo 'error: fish-tank is required to run these tests (https://github.com/terlar/fish-tank)'
  exit 1
end

set -l spec_path (dirname (status -f))

set -xg test_path $PATH
set -xg fry_rubies $spec_path/dummy-rubies
set -xg fry_auto_switch 0

. $spec_path/../share/fry/fry.fish

function setup_tank; end
function clean_tank; end
