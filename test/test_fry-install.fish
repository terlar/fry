function suite_fry-install
  function setup
    function which_stub
      switch $argv
        case 'ruby-build'; echo '/dev/null/ruby-build'
      end
    end
    stub which which_stub

    function ruby-build_stub
      switch $argv[1]
        case '--definitions'; echo 'ruby-2.0'
        case '*'            ; echo "ruby-build $argv"
      end
    end
    stub ruby-build ruby-build_stub

    stub_var fry_rubies /tmp/rubies
  end

  function test_missing_build_command
    function which_stub; end
    stub which which_stub

    refute (fry-install)
    assert_equal 'fry-install: This feature requires ruby-build' (fry-install)
  end

  function test_argument_validation
    refute (fry-install)
    assert_includes 'fry-install: No <ruby> given' (fry-install)
    assert_includes 'Available rubies:' (fry-install)
    assert_includes 'ruby-2.0' (fry-install)
  end

  function test_unknown_ruby
    refute (fry-install unknown)
    assert_includes "fry-install: Unknown ruby 'unknown'" (fry-install unknown)
    assert_includes 'Available rubies:' (fry-install)
    assert_includes 'ruby-2.0' (fry-install unknown)
  end

  function test_known_ruby
    assert (fry-install ruby-2.0)
    assert_equal 'ruby-build ruby-2.0 /tmp/rubies/ruby-2.0' (fry-install ruby-2.0)
  end
end

if not set -q tank_running
  source (dirname (status -f))/helper.fish
  tank_run
end
