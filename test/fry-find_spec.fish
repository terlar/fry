. (dirname (status -f))/helper.fish

function setup_tank
  function fry-ls
    echo 1.9.3-p392
    echo ruby-2.0.0-p0
    echo jruby-1.7.3
  end
end

function it_matches_exactly
  test (fry-find jruby-1.7.3) = 'jruby-1.7.3'
end

function it_matches_fuzzily
  test (fry-find ruby-2.0.0) = 'ruby-2.0.0-p0'
end

function it_matches_ruby_prefixed_with_version
  test (fry-find 2.0.0-p0) = 'ruby-2.0.0-p0'
end

function it_matches_version_with_ruby_prefix
  test (fry-find ruby-1.9.3-p392) = '1.9.3-p392'
end

. $fish_tank
