function fry --description 'Fishy ruby switcher'
    if test (count $argv) -eq 0
        set argv rubies
    end

    switch $argv[1]
        case 'help' '-h' '--help'
            fry-help
            return
    end

    set -l command $argv[1]
    set -e argv[1]
    set -l func_name "fry-$command"
    set -l return_status 0

    if functions -q $func_name
        eval $func_name $argv
        set return_status $status
    else
        if test (fry-find $command)
            fry-use $command
        else
            fry-help
        end
    end

    return $return_status
end
