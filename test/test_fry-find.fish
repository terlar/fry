source (dirname (status -f))/helper.fish

function test_fry-find -e tank_test
  function setup
    function fry-ls
      echo 1.8.7-p371
      echo 1.8.7-p374
      echo 1.9.3-p392
      echo jruby-1.7.3
      echo ruby-2.0.0-p0
    end
  end

  function test_exit_status
    assert (fry-find)
  end

  function test_exact_match
    assert_equal jruby-1.7.3 (fry-find jruby-1.7.3)
  end

  function test_fuzzy_match
    assert_equal ruby-2.0.0-p0 (fry-find ruby-2.0.0)
    assert_equal 1.8.7-p374 (fry-find 1.8.7)
    assert_equal ruby-2.0.0-p0 (fry-find 2.0.0-p0)
    assert_equal 1.9.3-p392 (fry-find ruby-1.9.3-p392)
  end
end

tank_autorun
