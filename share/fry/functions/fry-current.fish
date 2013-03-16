function fry-current --description 'Show the current ruby'
  for i in $PATH
    if test (echo $i | grep $fry_rubies)
      basename (dirname $i)
      return
    end
  end

  echo 'system'
end
