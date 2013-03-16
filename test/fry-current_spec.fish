. helper.fish

function clean_tank
  set PATH $test_path
end

function spec_current_1 -d 'outputs current ruby when found'
  set PATH $fry_rubies/dummy-1/bin $PATH
  test (fry-current) = dummy-1
end

function spec_current_2 -d 'outputs system ruby when not found'
  test (fry-current) = system
end

. tank/tank.fish (status -f)
