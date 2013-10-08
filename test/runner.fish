echo

set -l error 0
for test in (dirname (status -f))/test_*.fish
  echo Running $test
  fish $test; or set error 1
  echo
end

exit $error
