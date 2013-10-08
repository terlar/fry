source (dirname (status -f))/helper.fish

function test_fry-rubies -e tank_test
  function setup
    function fry-current
      echo dummy-1.5
    end

    function fry-ls
      echo dummy-1.0
      echo dummy-1.5
      echo dummy-2.0
    end
  end

  function test_exit_status
    assert (fry-rubies)
  end

  function test_output
    set -l normal (set_color normal)
    set -l green  (set_color green)

    assert_includes '  dummy-1.0'$normal (fry-rubies)
    assert_includes '* '$green'dummy-1.5'$normal (fry-rubies)
    assert_includes '  dummy-2.0'$normal (fry-rubies)
  end
end

tank_autorun
