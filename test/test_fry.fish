function suite_fry
  function setup
    function fry-truthy; true ; end
    function fry-falsy ; false; end
    function fry-args  ; echo $argv; end

    stub_var fry_rubies /tmp/rubies
    mkdir -p $fry_rubies/ruby-1.9/bin
    stub_var PATH $PATH
  end

  function teardown
    functions -e fry-truthy
    functions -e fry-falsy
    functions -e fry-args
    rm -r /tmp/rubies
  end

  function test_empty_arguments
    assert (fry)
    assert_includes (fry-rubies) (fry)
  end

  function test_command_delegation
    assert (fry truthy)
    refute (fry falsy)
    assert_equal (fry-version) (fry version)
    assert_equal (fry-args command --option) (fry args command --option)
  end

  function test_help_arguments
    set -l help_output (fry-help)

    for arg in help --help -h
      set -l output (fry $arg)
      assert_equal 0 $status
      assert_includes $help_output $output
    end
  end

  function test_invalid_arguments
    set -l help_output (fry-help)

    for arg in unknown --
      set -l output (fry $arg)
      assert_equal 0 $status
      assert_includes $help_output $output
    end
  end

  function test_ruby_switch
    set -l output (fry ruby-1.9)

    assert_equal 0 $status
    assert_includes "Switched to ruby 'ruby-1.9'" $output
    assert_equal $fry_rubies/ruby-1.9/bin $PATH[1]
  end
end

if not set -q tank_running
  source (dirname (status -f))/helper.fish
  tank_run
end
