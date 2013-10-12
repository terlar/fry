source (dirname (status -f))/helper.fish

function suite_fry-ls
  function setup
    stub_var fry_rubies /tmp/rubies
    mkdir -p $fry_rubies/ruby-2.0/bin
  end

  function teardown
    rm -r /tmp/rubies
  end

  function test_exit_status
    assert (fry-ls)
  end

  function test_output
    assert_includes system (fry-ls)
    assert_includes ruby-2.0 (fry-ls)
  end
end

tank_run
