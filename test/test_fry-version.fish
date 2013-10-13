function suite_fry-version
  function test_exit_status
    assert (fry-version)
  end

  function test_output
    refute_empty (fry-version)
  end
end

if not set -q tank_running
  source (dirname (status -f))/helper.fish
  tank_run
end
