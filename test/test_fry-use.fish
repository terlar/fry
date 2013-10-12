source (dirname (status -f))/helper.fish

function suite_fry-use
  function setup
    stub_var fry_rubies /tmp/rubies
    mkdir -p $fry_rubies/ruby-1.9/bin
    mkdir -p $fry_rubies/ruby-2.0/bin
    stub_var PATH $fry_rubies/ruby-2.0/bin $PATH
  end

  function teardown
    rm -r /tmp/rubies
  end

  function test_argument_validation
    set -l output (fry-use)

    refute_equal 0 $status
    assert_includes 'fry-use: No <ruby> given' $output
    assert_includes 'Available rubies:' $output
    assert_includes 'ruby-1.9' $output
    assert_includes 'ruby-2.0' $output
  end

  function test_unknown_ruby
    set -l output (fry-use unknown)

    refute_equal 0 $status
    assert_includes "fry-use: Unknown ruby 'unknown'" $output
    assert_includes 'Available rubies:' $output
    assert_includes 'ruby-1.9' $output
    assert_includes 'ruby-2.0' $output
  end

  function test_ruby_switch
    set -l output (fry-use ruby-1.9)

    assert_equal 0 $status
    assert_includes "Switched to ruby 'ruby-1.9'" $output
    assert_equal $fry_rubies/ruby-1.9/bin $PATH[1]
    refute_includes $fry_rubies/ruby-2.0/bin $PATH
  end

  function test_ruby_switch_with_current
    set -l output (fry-use ruby-2.0)

    assert_equal 0 $status
    assert_empty $output
    assert_equal $fry_rubies/ruby-2.0/bin $PATH[1]
  end

  function test_ruby_switch_with_system
    set -l output (fry-use system)

    assert_equal 0 $status
    assert_includes 'Switched to system ruby' $output
    refute_equal $fry_rubies/ruby-2.0/bin $PATH[1]

    set -l output (fry-use system)
    assert_equal 0 $status
    assert_empty $output
  end
end

tank_run
