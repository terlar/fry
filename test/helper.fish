function context
  echo " $argv"
end

function it
  echo -n "  $argv..."
end

function pass
  set_color green
  echo PASS
  set_color normal
end

function fail
  set_color red
  echo FAIL
  set_color normal
end

function stub
  set -l out $argv
  set -l cmd $argv[1]
  set -e out[1]

  eval "function $cmd; echo $out; end"
end

set -l test_path (pwd)

set fish_function_path $test_path/../share/fry/functions $fish_function_path

set -e fry_auto_switch
set -xg fry_rubies $test_path/dummy-rubies
