function __tank_reporter_spec
  if test $argv[1] -eq 0
    set_color green
    echo -n '  ✓ '
  else
    set_color red
    echo -n '  ✗ '
  end

  echo $argv[2]
  set_color normal
end
