function fry-ls --description 'List available rubies'
    echo 'system'
    command ls -1 $fry_rubies | cat
end
