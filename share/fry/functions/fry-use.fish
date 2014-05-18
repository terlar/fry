function fry-use --description 'Use the ruby given by <ruby>'
  if test (count $argv) -eq 0
    echo 'usage: fry use <ruby>'
    echo
    echo 'Available rubies:'
    fry-ls
    return
  end

  set -l name $argv[1]
  set -l ruby $name

  if test $name != 'system'
    set ruby (fry-find $name)
  end

  if test -z "$ruby"
    echo "error: unknown ruby `$name'"
    echo 'usage: fry use <ruby>'
    echo
    echo 'Available rubies:'
    fry-ls
    return 1
  end

  if test (fry-current) = "$ruby"
    return 0
  end

  __fry_reset

  if test $name = 'system'
    echo 'Switched to system ruby'
  else
    switch $name
      case 'rbx-*'
        set PATH $fry_rubies/$ruby/gems/bin $PATH
    end

    set PATH $fry_rubies/$ruby/bin $PATH
    echo "Switched to ruby '$ruby'"
  end
end
