function suite_fry-install
  function setup
    function fry-installer-dummy-install
      function __fry_install_ruby
        echo install $argv
      end

      function __fry_install_rubies
        echo ruby-1
        echo ruby-2
      end
    end

    stub_var fry_rubies /tmp/rubies
    stub_var fry_installer dummy-install
  end

  function test_missing_build_command
    set fry_installer unknown-install

    refute (fry-install)
    assert_equal 'fatal: This feature requires an installer' (fry-install)
  end

  function test_argument_validation
    set -l output (fry-install)

    assert_equal 0 $status
    assert_includes 'usage: fry install <ruby>' $output
    assert_includes 'Available rubies:' $output
    assert_includes 'ruby-1' $output
    assert_includes 'ruby-2' $output
  end

  function test_handling_of_bad_arguments
    refute (fry-install -l)
    refute (fry-install --help)
  end

  function test_unknown_ruby
    set -l output (fry-install unknown)

    assert_equal 1 $status
    assert_includes "error: unknown ruby `unknown'" $output
    assert_includes 'usage: fry install <ruby>' $output
    assert_includes 'Available rubies:' $output
    assert_includes 'ruby-1' $output
    assert_includes 'ruby-2' $output
  end

  function test_known_ruby
    assert (fry-install ruby-2)
    assert_equal 'install ruby-2' (fry-install ruby-2)
  end
end

if not set -q tank_running
  source (dirname (status -f))/helper.fish
  tank_run
end
