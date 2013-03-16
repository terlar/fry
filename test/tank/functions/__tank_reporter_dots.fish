function __tank_reporter_dots
  if test $argv[1] -eq 0
    set_color green
  else
    set_color red
  end

  echo -n .
  set_color normal
end
