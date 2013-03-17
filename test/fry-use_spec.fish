. helper.fish

function setup_tank
  function fry-rubies; echo __rubies__; end
end

function clean_tank
  set PATH $test_path
end

function it_returns_status_1_without_args -d 'returns status 1 without <ruby>'
  fry-use
  test $status -eq 1
end

function it_outputs_rubies_without_args -d 'outputs rubies without <ruby>'
  contains __rubies__ (fry-use)
end

function it_returns_status_1_with_unknown -d 'returns status 1 with unknown <ruby>'
  fry-use unknown
  test $status -eq 1
end

function it_outputs_rubies_with_unknown -d 'outputs rubies with unknown <ruby>'
  contains __rubies__ (fry-use unknown)
end

function it_returns_status_0_with_known -d 'returns status 0 with known <ruby>'
  fry-use dummy-1
  test $status -eq 0
end

function it_outputs_switch_text_with_known -d 'outputs switch text with known <ruby>'
  contains "Switched to ruby 'dummy-1'" (fry-use dummy-1)
end

function it_switches_ruby_with_known -d 'switches ruby with known <ruby>'
  fry-use dummy-1
  test $PATH[1] = $fry_rubies/dummy-1/bin
end

function it_resets_ruby_with_known -d 'resets ruby with known <ruby>'
  fry-use dummy-1
  not contains $fry_rubies/dummy-2/bin $PATH
end

function it_returns_status_0_with_current -d 'returns status 0 with current <ruby>'
  set PATH $fry_rubies/dummy-1/bin $PATH
  fry-use dummy-1
  test $status -eq 0
end

function it_outputs_nothing_with_current -d 'outputs nothing with current <ruby>'
  set PATH $fry_rubies/dummy-1/bin $PATH
  test -z (fry-use dummy-1)
end

function it_returns_status_0_with_system -d 'returns status 0 with system <ruby>'
  set PATH $fry_rubies/dummy-1/bin $PATH
  fry-use system
  test $status -eq 0
end

function it_resets_ruby_with_system -d 'resets ruby with system <ruby>'
  set PATH $fry_rubies/dummy-1/bin $PATH
  fry-use system
  not contains $fry_rubies/dummy-1/bin $PATH
end

function it_outputs_switch_text_with_system -d 'outputs switch text with system <ruby>'
  set PATH $fry_rubies/dummy-1/bin $PATH
  contains 'Switched to system ruby' (fry-use system)
end

function it_returns_status_0_with_system_as_current -d 'returns status 0 with system as current <ruby>'
  fry-use system
  test $status -eq 0
end

function it_outputs_nothing_with_system_as_current -d 'outputs nothing with system as current <ruby>'
  test -z (fry-use system)
end

. $fish_tank
