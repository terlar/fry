function __fry_find_version_file --description 'Find .ruby-version file'
  set -l file .ruby-version
  set -l dir $PWD

  while test $dir != '/'
    if test -f $dir/$file
      echo -n $dir/$file
      return 0
    end
    set dir (dirname $dir)
  end

  return 1
end
