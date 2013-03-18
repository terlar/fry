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
  fry help | grep '  ' | sed 's|^ *||;s|<.*> ||' | unexpand -t1
end

complete -f -c fry -n '__fish_fry_needs_command' -a '(__fish_fry)'
complete -f -c fry -n '__fish_fry_needs_command' -a '(fry ls)' -d 'Ruby'
complete -f -c fry -n '__fish_fry_using_command use' -a '(fry ls)' -d 'Ruby'

if test (which ruby-build)
  complete -f -c fry -n '__fish_fry_using_command install' -a '(ruby-build --definitions)' -d 'Ruby'
end
