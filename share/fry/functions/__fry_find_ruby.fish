function __fry_find_ruby --description 'Find ruby by name'
  set -l ruby
  set -l name $argv[1]

  if contains $name (fry-ls)
    set ruby $name
  end

  if test -z "$ruby"
    set -l rubyless (echo $name | sed 's/^ruby-//')

    if contains $rubyless (fry-ls)
      set ruby $rubyless
    end
  end

  if test -z "$ruby"
    return 1
  end

  echo $ruby
end
