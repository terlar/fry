source (dirname (status -f))/helper.fish

function test_fry -e tank_test
  function test_output_without_args
    function fry-rubies; echo fry-rubies; end

    assert_equal fry-rubies (fry)
  end

  function test_command_delegation
    function fry-version; echo fry-version; end
    function fry-truthy ; true; end
    function fry-falsy  ; false; end

    assert (fry truthy)
    refute (fry falsy)
    assert_equal fry-version (fry version)
  end

  function test_unknown_command
    function fry-help ; echo fry-help; end

    set -l output (fry unknown)
    assert_equal 0 $status
    assert_includes fry-help $output
  end

  function test_ruby_switch
    function fry-use; echo fry-use $argv; end
    function fry-ls ; echo ruby-1; end

    assert_equal 'fry-use ruby-1' (fry ruby-1)
  end

  function test_option_parsing
    function fry-help; echo fry-help; end

    assert_equal fry-help (fry --)
  end
end

tank_autorun
