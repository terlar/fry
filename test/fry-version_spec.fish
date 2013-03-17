. helper.fish

function it_outputs_version -d 'outputs version'
  not test -z (fry-version)
end

. $fish_tank
