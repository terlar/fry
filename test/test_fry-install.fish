source (dirname (status -f))/helper.fish

function test_fry-install -e tank_test
  function setup
    function which
      echo 'ruby-build'
    end

    function ruby-build
      switch $argv[1]
        case '--definitions'; echo 'known-ruby'
        case '*'            ; echo "ruby-build $argv"
      end
    end

    set -g old_fry_rubies $fry_rubies
    set -g fry_rubies /tmp/rubies
  end

  function teardown
    functions -e which
    functions -e ruby-build
    set fry_rubies $old_fry_rubies
  end

  function test_missing_build_command
    function which; end
    refute (fry-install)
    assert_equal 'fry-install: This feature requires ruby-build' (fry-install)
  end

  function test_argument_validation
    refute (fry-install)
    assert_includes 'fry-install: No <ruby> given' (fry-install)
    assert_includes 'Available rubies:' (fry-install)
    assert_includes 'known-ruby' (fry-install)
  end

  function test_unknown_ruby
    refute (fry-install unknown)
    assert_includes "fry-install: Unknown ruby 'unknown'" (fry-install unknown)
    assert_includes 'Available rubies:' (fry-install)
    assert_includes 'known-ruby' (fry-install unknown)
  end

  function test_known_ruby
    assert (fry-install known-ruby)
    assert_equal 'ruby-build known-ruby /tmp/rubies/known-ruby' (fry-install known-ruby)
  end
end

tank_autorun
