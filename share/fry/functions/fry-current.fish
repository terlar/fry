function fry-current --description 'Show the current ruby'
  for i in $PATH
    if echo $i | grep $fry_rubies >/dev/null
      basename (dirname $i)
      return
    end
  end

  echo 'system'
end
