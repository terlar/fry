. helper.fish

function setup_tank
  function fry-current; echo dummy-2; end
end

function it_contains_system
  function expected
    echo -n '  system'
    set_color normal
  end

  contains (expected) (fry-rubies)
end

function it_contains_rubies
  function expected
    echo -n '  dummy-1'
    set_color normal
  end

  contains (expected) (fry-rubies)
end

function it_highlights_current
  function expected
    echo -n '* '
    set_color green
    echo -n dummy-2
    set_color normal
  end

  contains (expected) (fry-rubies)
end

. $fish_tank
