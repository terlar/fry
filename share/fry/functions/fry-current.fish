function fry-current --description 'Show the current ruby'
  set -l option_path

  for arg in $argv
    switch $arg
      case '--path'; set option_path 1
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
    which ruby
  else
    echo 'system'
  end
end
