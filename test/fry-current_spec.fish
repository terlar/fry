. helper.fish

function clean_tank
  set PATH $test_path
end

function it_outputs_current_when_set
  set PATH $fry_rubies/dummy-1/bin $PATH
  test (fry-current) = dummy-1
end

function it_outputs_system_when_not_set
  test (fry-current) = system
end

. $fish_tank
