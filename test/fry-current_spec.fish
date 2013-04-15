. (dirname (status -f))/helper.fish

function clean_tank
  set PATH $test_path
end

function it_outputs_current_when_set
  set PATH $fry_rubies/dummy-1/bin $PATH
  test (fry-current) = dummy-1
end

function it_outputs_current_path_when_set_with_option_path
  set PATH $fry_rubies/dummy-1/bin $PATH
  test (fry-current --path) = $fry_rubies/dummy-1/bin
end

function it_outputs_system_when_not_set
  test (fry-current) = system
end

function it_outputs_system_path_when_not_set_with_option_path
  stub which
  function which-ruby; echo the/system/bin/path; end

  test (fry-current --path) = the/system/bin
end

. $fish_tank
