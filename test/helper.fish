set -l fish_tank /usr/local/share/fish-tank/tank.fish
if not test -e $fish_tank
	echo 'error: fish-tank is required to run these tests (https://github.com/terlar/fish-tank)'
	exit 1
end

function fry-installer-test
	return 0
end

set -g fry_auto_switch 0
set -g fry_prepend_path 0
set -g fry_rubies (mktemp -d fry_test_rubies.XXXXXXXXXX)
set -g fry_installer test

function fry_after_all -e tank_finished
	functions -e fry-installer-test
	functions -e fry_after_all
	rm -r $fry_rubies
end

source $fish_tank
source (dirname (status -f))/../share/fry/fry.fish
