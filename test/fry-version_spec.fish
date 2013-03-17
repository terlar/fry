. helper.fish

function it_outputs_version
  not test -z (fry-version)
end

. $fish_tank
