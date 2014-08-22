function fry-find --description 'Find ruby by name'
	set -l name $argv[1]
	set -l rubyless_name (echo $name | sed 's/^ruby-//')

	if test -d "$fry_rubies/$name"
			echo $name
			return
	end

	for i in (fry-ls | sort -r -n)
		switch $i
			case "$name*" "$rubyless_name*" "ruby-$name*"
				echo $i
				return
		end
	end

	return 1
end
