function fry-install --description 'Install rubies (requires an installer)'
  if not functions -q __fry_install_ruby
    echo 'fatal: This feature requires an installer'
    return 1
  end

  if test (count $argv) -eq 0
    echo 'usage: fry install <ruby>'
    echo
    echo 'Available rubies:'
    __fry_install_rubies
    return
  end

  set -l name $argv[1]

  if not contains -- $name (__fry_install_rubies)
    echo "error: unknown ruby `$name'"
    echo 'usage: fry install <ruby>'
    echo
    echo 'Available rubies:'
    __fry_install_rubies
    return 1
  end

  __fry_install_ruby $name
end
