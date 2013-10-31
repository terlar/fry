function fry-ls --description 'List available rubies'
  echo 'system'
  /usr/bin/env ls -1 $fry_rubies | cat
end
