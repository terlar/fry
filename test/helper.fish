if not set -q tank_helper
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

	set -l fry_project_path (realpath (dirname (status -f))/..)
	set fish_function_path $fry_project_path/functions $fish_function_path
	source $fry_project_path/conf.d/fry.fish

	source $fish_tank
	set -g tank_helper 1
	set -q tank_runner; or tank_run
end
