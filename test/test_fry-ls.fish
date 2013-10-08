source (dirname (status -f))/helper.fish

function test_fry-ls -e tank_test
  function setup
    function ls
      echo 'dummy-1.0'
    end
  end

  function test_exit_status
    assert (fry-ls)
  end

  function test_output
    assert_includes system (fry-ls)
    assert_includes dummy-1.0 (fry-ls)
  end
end

tank_autorun
