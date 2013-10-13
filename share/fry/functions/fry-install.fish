function fry-install --description 'Install rubies (requires ruby-build)'
  if not test (which ruby-build)
    echo 'fry-install: This feature requires ruby-build'
    return 1
  end

  if test (count $argv) -eq 0
    echo 'fry-install: No <ruby> given'
    echo
    echo 'Available rubies:'
    ruby-build --definitions
    return 1
  end

  set -l name $argv[1]

  if not contains "$name" (ruby-build --definitions)
    echo "fry-install: Unknown ruby '$name'"
    echo
    echo 'Available rubies:'
    ruby-build --definitions
    return 1
  end

  ruby-build $name $fry_rubies/$name
end
