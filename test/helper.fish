set -l fish_tank /usr/local/share/fish-tank/tank.fish
if not test -e $fish_tank
  echo 'error: fish-tank is required to run these tests (https://github.com/terlar/fish-tank)'
  exit 1
end

set -g fry_rubies /tmp/rubies
set -g fry_auto_switch 0

source $fish_tank
source (dirname (status -f))/../share/fry/fry.fish
