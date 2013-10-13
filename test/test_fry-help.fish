function suite_fry-help
  function test_exit_status
    assert (fry-help)
  end

  function test_output
    refute_empty (fry-help)
  end
end

if not set -q tank_running
  source (dirname (status -f))/helper.fish
  tank_run
end
