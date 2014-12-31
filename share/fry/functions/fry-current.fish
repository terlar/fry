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

	set -l available_ruby_paths (printf '%s\n' $fry_rubies/(fry-ls)/bin)

	for p in $fish_user_paths
		if not contains $p $available_ruby_paths
			continue
		end

		if test $show_path -eq 1
			echo $p
		else
			basename (dirname $p)
		end

		return
	end

	if test $show_path -eq 1
		dirname (type -p ruby)
	else
		echo 'system'
	end
end
