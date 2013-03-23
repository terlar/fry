. helper.fish

function setup_tank
  function ruby-build
    switch $argv[1]
      case '--definitions'
        echo 'known'
      case '*'
        echo "ruby-build $argv"
    end
  end
end

function clean_tank
  functions -e which
  functions -e ruby-build
end


function it_returns_status_1_without_ruby-build
  function which; return 1; end

  fry-install
  test $status -eq 1
end

function it_outputs_error_message_without_ruby-build
  function which; return 1; end

  test (fry-install) = 'fry-install: This feature requires ruby-build'
end

function it_returns_status_1_without_args
  fry-install
  test $status -eq 1
end

function it_outputs_ruby-build_definitions_without_args
  contains 'known' (fry-install)
end

function it_outputs_error_message_without_args
  contains 'fry-install: No <ruby> given' (fry-install)
end

function it_returns_status_1_when_unknown
  fry-install unknown
  test $status -eq 1
end

function it_outputs_ruby-build_definitions_when_unknown
  contains 'known' (fry-install unknown)
end

function it_outputs_error_message_when_unknown
  contains "fry-install: Unknown ruby 'unknown'" (fry-install unknown)
end

function it_returns_status_0_when_known
  fry-install known
  test $status -eq 0
end

function it_installs_ruby_when_known
  contains "ruby-build known $fry_rubies/known" (fry-install known)
end

. $fish_tank
