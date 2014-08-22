function __fry_reset --description 'Remove rubies from path'
	set -l new_path

	for i in $PATH
		switch $i
			case "$fry_rubies*"
				continue
			case '*'
				set new_path $new_path $i
		end
	end

	set PATH $new_path
end
