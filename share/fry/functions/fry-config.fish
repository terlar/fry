function fry-config --description 'Configuration for fry'
	if test (count $argv) -eq 0
		set argv help
	end

	switch $argv[1]
		case help -h --help
			echo 'usage: fry config <name> [<value>]'
			echo
			echo 'Available configuration:'
			echo
			echo '    auto [on|off|1|0]         switch ruby on directory change'
			echo '    prepend [on|off|1|0]      prepend ruby path when used'
			echo '    path, rubies [<path>]     path where fry looks for rubies'
			echo '    installer [<installer>]   switch ruby installer to use'
			echo
			echo 'Current configuration:'

			for name in auto prepend path installer
				echo '    '(fry-config $name)
			end
		case auto
			if set -q argv[2]
				switch $argv[2]
					case on 1
						set fry_auto_switch 1
					case off 0
						set fry_auto_switch 0
				end
			end

			if test $fry_auto_switch = 1
				echo 'Auto-Switch: on'
			else
				echo 'Auto-Switch: off'
			end
		case prepend
			if set -q argv[2]
				switch $argv[2]
					case on 1
						set fry_prepend_path 1
					case off 0
						set fry_prepend_path 0
				end
			end

			if test $fry_prepend_path = 1
				echo 'Prepend Path: on'
			else
				echo 'Prepend Path: off'
			end
		case path rubies
			if set -q argv[2]
				set fry_rubies $argv[2]
			end
			echo "Path: $fry_rubies"
		case installer
			if set -q argv[2]
				set fry_installer $argv[2]
			end
			echo "Installer: $fry_installer"
		case '*'
			fry-config help
			return 1
	end
end
