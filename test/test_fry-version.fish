source (dirname (status -f))/helper.fish

function suite_fry-version
  function test_exit_status
    assert (fry-version)
  end

  function test_output
    refute_empty (fry-version)
  end
end

tank_run
