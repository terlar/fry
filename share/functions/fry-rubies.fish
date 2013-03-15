function fry-rubies --description 'List the installed rubies with the current one highlighted'
  set -l rubies (fry-ls)
  set -l current (fry-current)

  for i in $rubies
    if test $i = $current
      echo -n '*'
      set_color green
    else
      echo -n ' '
    end

    echo " $i"
    set_color normal
  end
end
