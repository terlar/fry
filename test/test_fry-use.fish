source (dirname (status -f))/helper.fish

function test_fry-use -e tank_test
  function setup
    function fry-ls
      echo ruby-1
      echo ruby-2
    end

    set -g old_path $PATH
    set -g old_fry_rubies $fry_rubies

    mkdir -p /tmp/rubies/ruby-1/bin
    mkdir -p /tmp/rubies/ruby-2/bin
    set -g fry_rubies /tmp/rubies
    set PATH $fry_rubies/ruby-2/bin $PATH
  end

  function teardown
    rm -r /tmp/rubies
    set PATH $old_path
    set fry_rubies $old_fry_rubies
  end

  function test_argument_validation
    set -l output (fry-use)

    refute_equal 0 $status
    assert_includes 'fry-use: No <ruby> given' $output
    assert_includes 'Available rubies:' $output
    assert_includes 'ruby-1' $output
    assert_includes 'ruby-2' $output
  end

  function test_unknown_ruby
    set -l output (fry-use unknown)

    refute_equal 0 $status
    assert_includes "fry-use: Unknown ruby 'unknown'" $output
    assert_includes 'Available rubies:' $output
    assert_includes 'ruby-1' $output
    assert_includes 'ruby-2' $output
  end

  function test_ruby_switch
    set -l output (fry-use ruby-1)

    assert_equal 0 $status
    assert_includes "Switched to ruby 'ruby-1'" $output
    assert_equal $fry_rubies/ruby-1/bin $PATH[1]
    refute_includes $fry_rubies/ruby-2/bin $PATH
  end

  function test_ruby_switch_with_current
    set -l output (fry-use ruby-2)

    assert_equal 0 $status
    assert_empty $output
    assert_equal $fry_rubies/ruby-2/bin $PATH[1]
  end

  function test_ruby_switch_with_system
    set -l output (fry-use system)

    assert_equal 0 $status
    assert_includes 'Switched to system ruby' $output
    refute_equal $fry_rubies/ruby-2/bin $PATH[1]

    set -l output (fry-use system)
    assert_equal 0 $status
    assert_empty $output
  end
end

tank_autorun
