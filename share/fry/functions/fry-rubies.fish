function fry-rubies --description 'List available rubies with the current one highlighted'
	for ruby in (fry-ls)
		if test $ruby = (fry-current)
			echo -n '* '
			set_color green
		else
			echo -n '  '
		end

		echo $ruby(set_color normal)
	end
end
