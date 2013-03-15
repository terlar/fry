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

set -xg fry_path $PWD/../share/fry
set -xg fry_rubies $PWD/dummy-rubies
set -xg fry_auto_switch 0

. $fry_path/fry.fish
