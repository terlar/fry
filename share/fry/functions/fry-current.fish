function fry-current --description 'Show the current ruby'
	set -l show_path 0

	for arg in $argv
		switch $arg
			case '--path'
				set show_path 1
			case '-h' '--help'
				echo 'usage: fry current [options]'
				echo
				echo '    --path        show path of current ruby'
				return
			case '-*' '--*'
				echo "error: unknown option `$arg'"
				fry-current --help
				return 1
		end
	end

	for i in $fish_user_paths
		if test (expr $i : $fry_rubies) -eq 0
			continue
		end

		if test $show_path -eq 1
			echo $i
		else
			basename (dirname $i)
		end

		return
	end

	if test $show_path -eq 1
		dirname (type -p ruby)
	else
		echo 'system'
	end
end
