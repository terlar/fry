function fry-rubies --description 'List available rubies with the current one highlighted'
	set -l current_ruby (fry-current)

	for ruby in (fry-ls)
		if test "$ruby" = "$current_ruby"
			echo -n '* '
			set_color green
		else
			echo -n '  '
		end

		echo $ruby(set_color normal)
	end
end
