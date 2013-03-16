. helper.fish

function spec_version_1 -d 'outputs version'
  not test -z (fry-version)
end

. $fish_tank
