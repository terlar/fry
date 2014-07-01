function suite_fry-find
  function setup
    stub_var fry_rubies /tmp/rubies
    mkdir -p $fry_rubies/1.8.7-p371
    mkdir -p $fry_rubies/1.8.7-p374
    mkdir -p $fry_rubies/1.9.3
    mkdir -p $fry_rubies/1.9.3-p392
    mkdir -p $fry_rubies/jruby-1.7.3
    mkdir -p $fry_rubies/ruby-2.0.0-p0
  end

  function teardown
    rm -r /tmp/rubies
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

  function test_absolute_match_precedence
    assert_equal 1.9.3 (fry-find 1.9.3)
    assert_equal 1.9.3-p392 (fry-find 1.9.3-p392)
  end
end

if not set -q tank_running
  source (dirname (status -f))/helper.fish
  tank_run
end
