source (dirname (status -f))/helper.fish

function test_fry-current -e tank_test
  function setup
    set -g old_path $PATH
    set -g old_fry_rubies $fry_rubies

    mkdir -p /tmp/rubies/dummy-1.5/bin
    set -g fry_rubies /tmp/rubies
  end

  function teardown
    rm -r /tmp/rubies
    set PATH $old_path
    set fry_rubies $old_fry_rubies
  end

  function test_exit_status
    assert (fry-current)
  end

  function test_output_when_ruby_is_in_path
    set PATH /tmp/rubies/dummy-1.5/bin $PATH

    assert_equal 'dummy-1.5' (fry-current)
  end

  function test_output_when_ruby_is_not_in_path
    assert_equal 'system' (fry-current)
  end

  function test_path_output_when_ruby_is_in_path
    set PATH /tmp/rubies/dummy-1.5/bin $PATH

    assert_equal '/tmp/rubies/dummy-1.5/bin' (fry-current --path)
  end

  function test_path_output_when_ruby_is_not_in_path
    function which
      switch $argv
        case 'ruby'; echo 'system/bin/ruby'
      end
    end

    assert_equal 'system/bin' (fry-current --path)
  end

end

tank_autorun
