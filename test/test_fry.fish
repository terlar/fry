function suite_fry
  function setup
    function fry-truthy; true ; end
    function fry-falsy ; false; end

    stub_var fry_rubies /tmp/rubies
    mkdir -p $fry_rubies/ruby-1.9/bin
    stub_var PATH $PATH
  end

  function teardown
    functions -e fry-truthy
    functions -e fry-falsy
    rm -r /tmp/rubies
  end

  function test_output_without_args
    set -l normal (set_color normal)
    set -l green  (set_color green)
    set -l output (fry)

    assert_includes '  ruby-1.9'$normal $output
    assert_includes '* '$green'system'$normal $output
  end

  function test_command_delegation
    assert (fry truthy)
    refute (fry falsy)
    assert_equal (fry-version) (fry version)
  end

  function test_unknown_command
    set -l help_output (fry-help)
    set -l output (fry unknown)

    assert_equal 0 $status
    assert_includes $help_output $output
  end

  function test_ruby_switch
    set -l output (fry ruby-1.9)

    assert_equal 0 $status
    assert_includes "Switched to ruby 'ruby-1.9'" $output
    assert_equal $fry_rubies/ruby-1.9/bin $PATH[1]
  end

  function test_option_parsing
    set -l help_output (fry-help)
    set -l output (fry --)

    assert_includes $help_output $output
  end
end

if not set -q tank_running
  source (dirname (status -f))/helper.fish
  tank_run
end
