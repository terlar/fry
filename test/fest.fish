function it
  if test $status -eq 0
    set_color green
    echo -n '  ✓ '
  else
    set_color red
    echo -n '  ✗ '
  end

  echo $argv[1]
  set_color normal
end

function context
  echo "  $argv"
end

function assert
  not test -z $argv
end

function assert_status
  test $status -eq 0
end

function assert_equals
  test $argv[1] = $argv[2]
end

function assert_greater
  test $argv[1] -gt $argv[2]
end

function assert_contains
  contains $argv
end

function stub
  set -l cmd $argv[1]
  set -e argv[1]
  set -l out $argv

  eval "function $cmd; for i in $out; echo \$i; end; end"
end

for name in '' status equals greater contains
  if test -n "$name"
    set name _$name
  end

  set -l assert_function assert$name
  set -l refute_function refute$name

  if not functions -q $assert_function
    continue
  end

  eval 'function '$refute_function'; '$assert_function' $argv; and return 1; return 0; end'
end
