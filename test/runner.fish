#!/usr/local/bin/fish

echo Running tests under fish
echo

for test in *_test.fish
  echo Running $test
  fish $test
  echo
end
