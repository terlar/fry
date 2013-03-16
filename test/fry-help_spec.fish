. helper.fish

function spec_help_1 -d 'outputs help'
  test (count (fry-help)) -gt 0
end

. $fish_tank
