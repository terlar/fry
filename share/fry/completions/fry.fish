# fish completion for fry
function __fish_fry_needs_command
	set cmd (commandline -opc)
	if [ (count $cmd) -eq 1 -a $cmd[1] = 'fry' ]
		return 0
	end
	return 1
end

function __fish_fry_using_command
	set cmd (commandline -opc)
	if [ (count $cmd) -gt 1 ]
		if [ $argv[1] = $cmd[2] ]
			return 0
		end
	end
	return 1
end

function __fish_fry
	fry help | grep '  ' | sed 's|^ *||;s|[<[].*[]>] ||' | unexpand -t2
end

complete -f -c fry -n '__fish_fry_needs_command' -a '(__fish_fry)'
complete -f -c fry -n '__fish_fry_needs_command' -a '(fry ls)' -d 'Ruby'
complete -f -c fry -n '__fish_fry_using_command use' -a '(fry ls)' -d 'Ruby'
complete -f -c fry -n '__fish_fry_using_command config' -a 'auto path rubies' -d 'Config'

if functions -q __fry_install_rubies
	complete -f -c fry -n '__fish_fry_using_command install' -a '(__fry_install_rubies)' -d 'Ruby'
end
