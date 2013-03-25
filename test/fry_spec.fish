. (dirname (status -f))/helper.fish

function setup_tank
  function fry-dummy  ; return 1; end
  function fry-help   ; echo __help__; end
  function fry-rubies ; echo __rubies__; end
  function fry-version; echo __version__; end
  function fry-use    ; echo __use__; end
end

function it_returns_status_from_command
  fry dummy
  test $status -eq 1
end

function it_handles_dashes
  test (fry --) = __help__
end

function it_outputs_rubies_without_args
  test (fry) = __rubies__
end

function it_outputs_help_with_unknown_command
  test (fry unknown) = __help__
end

function it_outputs_command_with_known_command
  test (fry version) = __version__
end

function it_switches_ruby_with_known_ruby
  test (fry dummy-1) = __use__
end

. $fish_tank
