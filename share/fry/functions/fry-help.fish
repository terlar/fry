function fry-help --description 'Display help information'
  echo 'usage: fry [<command>|<ruby>] [<args>]'
  echo
  echo 'Commands:'
  echo '  ls              List the installed rubies'
  echo '  rubies          List the installed rubies with the current one highlighted'
  echo '  find            Fuzzy find installed ruby'
  echo '  current         Show the current ruby'
  echo '  use <ruby>      Use the ruby given by <ruby>'
  echo '  version         Display the current version of fry'
  echo '  help            Display help information'
  echo '  install <ruby>  Download, compile and install (requires ruby-build)'
end
