echo

set -l error 0
for spec in (dirname (status -f))/*_spec.fish
  echo Running $spec
  fish $spec; or set error 1
  echo
end

exit $error
