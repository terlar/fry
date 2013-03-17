. helper.fish

function clean_tank
  set PATH $test_path
end

function it_outputs_current_ruby_when_found -d 'outputs current ruby when found'
  set PATH $fry_rubies/dummy-1/bin $PATH
  test (fry-current) = dummy-1
end

function it_outputs_system_ruby_when_not_found -d 'outputs system ruby when not found'
  test (fry-current) = system
end

. $fish_tank
