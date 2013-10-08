source (dirname (status -f))/helper.fish

function test_fry-help -e tank_test
  function test_exit_status
    assert (fry-help)
  end

  function test_output
    refute_empty (fry-help)
  end
end

tank_autorun
