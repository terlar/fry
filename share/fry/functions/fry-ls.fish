function fry-ls --description 'List the installed rubies'
  echo 'system'
  ls -1 $fry_rubies | cat
end
