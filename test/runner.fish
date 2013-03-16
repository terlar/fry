echo

set -l error 0
for spec in *_spec.fish
  echo Running $spec
  fish $spec; or set error 1
  echo
end

exit $error
