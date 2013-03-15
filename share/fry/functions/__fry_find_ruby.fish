function __fry_find_ruby --description 'Find ruby by name'
  set -l name $argv[1]
  set -l ruby (fry-ls | grep -m 1 $name)

  if test -z "$ruby"
    set -l rubyless (echo $name | sed 's/^ruby-//')
    set ruby (fry-ls | grep -m 1 $rubyless)
  end

  if test -z "$ruby"
    return 1
  end

  echo $ruby
end
