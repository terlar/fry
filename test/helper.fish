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
  set -l cmd $argv[1]
  set -e argv[1]
  set -l out $argv

  eval "function $cmd; for i in $out; echo \$i; end; end"
end

set -xg fry_rubies $PWD/dummy-rubies
set -xg fry_auto_switch 0

. ../share/fry/fry.fish
