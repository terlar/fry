function fry-current --description 'Show the current ruby'
  set -l option_path

  for arg in $argv
    switch $arg
      case '--path'; set option_path 1
      case '-h' '--help'
        echo 'usage: fry current [options]'
        echo
        echo '    --path        show path of current ruby'
        return
      case '-*' '--*'
        echo "error: unknown option `$arg'"
        fry-current --help
        return 1
    end
  end

  for i in $PATH
    if test (echo $i | grep $fry_rubies)
      if set -ql option_path[1]
        echo $i
      else
        basename (dirname $i)
      end

      return
    end
  end

  if set -ql option_path[1]
    dirname (which ruby)
  else
    echo 'system'
  end
end
