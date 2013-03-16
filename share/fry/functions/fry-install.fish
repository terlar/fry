function fry-install --description 'Download, compile and install (requires ruby-build)'
  if not test (which ruby-build)
    echo 'fry-install: You must install ruby-build to use this feature'
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

  if not contains $name (ruby-build --definitions)
    echo "fry-install: Unknown ruby '$name'"
    echo
    echo 'Available rubies:'
    ruby-build --definitions
    return 1
  end

  ruby-build $name $fry_rubies/$name
end
