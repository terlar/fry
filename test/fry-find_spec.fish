. (dirname (status -f))/helper.fish

function setup_tank
  function fry-ls
    echo 1.8.7-p371
    echo 1.8.7-p374
    echo 1.9.3-p392
    echo jruby-1.7.3
    echo ruby-2.0.0-p0
  end
end

function it_matches_exactly
  test (fry-find jruby-1.7.3) = 'jruby-1.7.3'
end

function it_matches_fuzzily
  test (fry-find ruby-2.0.0) = 'ruby-2.0.0-p0'
end

function it_matches_fuzzily_with_latest_version_preferred
  test (fry-find 1.8.7) = '1.8.7-p374'
end

function it_matches_ruby_prefixed_with_version
  test (fry-find 2.0.0-p0) = 'ruby-2.0.0-p0'
end

function it_matches_version_with_ruby_prefix
  test (fry-find ruby-1.9.3-p392) = '1.9.3-p392'
end

. $fish_tank
