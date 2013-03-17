function fry-help --description 'Display help information'
  echo 'usage: fry [<command>|<ruby>] [<args>]'
  echo
  echo 'Commands:'
  echo '  ls              List available rubies'
  echo '  rubies          List available rubies with the current one highlighted'
  echo '  find            Fuzzy find available ruby'
  echo '  current         Show the current ruby'
  echo '  use <ruby>      Use the ruby given by <ruby>'
  echo '  install <ruby>  Install rubies (requires ruby-build)'
  echo '  version         Display the current version of fry'
  echo '  help            Display help information'
end
