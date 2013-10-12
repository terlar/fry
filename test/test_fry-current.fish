function suite_fry-current
  function setup
    stub_var fry_rubies /tmp/rubies
    mkdir -p $fry_rubies/ruby-2.0/bin
  end

  function teardown
    rm -r /tmp/rubies
  end

  function test_exit_status
    assert (fry-current)
  end

  function test_output_when_ruby_is_in_path
    stub_var PATH $fry_rubies/ruby-2.0/bin $PATH
    assert_equal 'ruby-2.0' (fry-current)
  end

  function test_output_when_ruby_is_not_in_path
    assert_equal 'system' (fry-current)
  end

  function test_path_output_when_ruby_is_in_path
    stub_var PATH $fry_rubies/ruby-2.0/bin $PATH
    assert_equal '/tmp/rubies/ruby-2.0/bin' (fry-current --path)
  end

  function test_path_output_when_ruby_is_not_in_path
    function which_stub
      switch $argv
        case 'ruby'; echo '/dev/null/system/bin/ruby'
      end
    end
    stub which which_stub

    assert_equal '/dev/null/system/bin' (fry-current --path)
  end

end

if not set -q tank_running
  source (dirname (status -f))/helper.fish
  tank_run
end
