. helper.fish

function it_outputs_help -d 'outputs help'
  test (count (fry-help)) -gt 0
end

. $fish_tank
