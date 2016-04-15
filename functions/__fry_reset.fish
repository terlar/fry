function __fry_reset --description 'Remove rubies from path'
	set -l new_path

	for i in $fish_user_paths
		switch $i
			case "$fry_rubies*"
				continue
			case '*'
				set new_path $new_path $i
		end
	end

	set fish_user_paths $new_path
end
