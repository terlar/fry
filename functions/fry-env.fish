function fry-env --description 'POSIX compatible environment output'
    set -l ruby_path

    if set -q argv[1]
        set ruby_path $fry_rubies/(fry-find $argv[1])/bin
    else
        set ruby_path '$(fish -c \'fry current --path\')'
    end

    echo 'export PATH="'$ruby_path':$PATH"'
end
