. helper.fish

function setup_tank
  function fry-ls
    echo 1.9.3
    echo ruby-2.0.0
    echo dummy-1.0.0
  end
end

function spec_find_fuzzy -d 'matches fuzzily'
  test (fry-find ruby-2.0) = 'ruby-2.0.0'
end

function spec_find_rubyless -d 'matches rubyless'
  test (fry-find ruby-1.9) = '1.9.3'
end

. tank/tank.fish (status -f)
