. helper.fish

function setup_tank
  function fry-rubies; echo __rubies__; end
end

function clean_tank
  set PATH $test_path
end

function spec_use_without_1 -d 'returns status 1 without <ruby>'
  fry-use
  test $status -eq 1
end

function spec_use_without_2 -d 'outputs rubies without <ruby>'
  contains __rubies__ (fry-use)
end

function spec_use_with_unknown_1 -d 'returns status 1 with unknown <ruby>'
  fry-use unknown
  test $status -eq 1
end

function spec_use_with_unknown_2 -d 'outputs rubies with unknown <ruby>'
  contains __rubies__ (fry-use unknown)
end

function spec_use_with_known_1 -d 'returns status 0 with known <ruby>'
  fry-use dummy-1
  test $status -eq 0
end

function spec_use_with_known_2 -d 'outputs switch text with known <ruby>'
  contains "Switched to ruby 'dummy-1'" (fry-use dummy-1)
end

function spec_use_with_known_3 -d 'switches ruby with known <ruby>'
  fry-use dummy-1
  test $PATH[1] = $fry_rubies/dummy-1/bin
end

function spec_use_with_known_4 -d 'resets ruby with known <ruby>'
  fry-use dummy-1
  not contains $fry_rubies/dummy-2/bin $PATH
end

function spec_use_with_current_1 -d 'returns status 0 with current <ruby>'
  set PATH $fry_rubies/dummy-1/bin $PATH
  fry-use dummy-1
  test $status -eq 0
end

function spec_use_with_current_2 -d 'outputs nothing with current <ruby>'
  set PATH $fry_rubies/dummy-1/bin $PATH
  test -z (fry-use dummy-1)
end

function spec_use_with_system_1 -d 'returns status 0 with system <ruby>'
  set PATH $fry_rubies/dummy-1/bin $PATH
  fry-use system
  test $status -eq 0
end

function spec_use_with_system_2 -d 'resets ruby with system <ruby>'
  set PATH $fry_rubies/dummy-1/bin $PATH
  fry-use system
  not contains $fry_rubies/dummy-1/bin $PATH
end

function spec_use_with_system_3 -d 'outputs switch text with system <ruby>'
  set PATH $fry_rubies/dummy-1/bin $PATH
  contains 'Switched to system ruby' (fry-use system)
end

function spec_use_with_system_as_current_1 -d 'returns status 0 with system as current <ruby>'
  fry-use system
  test $status -eq 0
end

function spec_use_with_system_as_current_2 -d 'outputs nothing with system as current <ruby>'
  test -z (fry-use system)
end

. $fish_tank
