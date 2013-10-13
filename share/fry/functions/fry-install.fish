function fry-install --description 'Install rubies (requires ruby-build)'
  if not test (which ruby-build)
    echo 'fatal: This feature requires ruby-build'
    return 1
  end

  if test (count $argv) -eq 0
    echo 'usage: fry install <ruby>'
    echo
    echo 'Available rubies:'
    ruby-build --definitions
    return
  end

  set -l name $argv[1]

  if not contains -- $name (ruby-build --definitions)
    echo "error: unknown ruby `$name'"
    echo 'usage: fry install <ruby>'
    echo
    echo 'Available rubies:'
    ruby-build --definitions
    return 1
  end

  ruby-build $name $fry_rubies/$name
end
