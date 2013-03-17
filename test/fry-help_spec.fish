. helper.fish

function it_outputs_help
  test (count (fry-help)) -gt 0
end

. $fish_tank
