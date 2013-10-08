source (dirname (status -f))/helper.fish

function test_fry-version -e tank_test
  function test_exit_status
    assert (fry-version)
  end

  function test_output
    refute_empty (fry-version)
  end
end

tank_autorun
