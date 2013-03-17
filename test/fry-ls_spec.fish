. helper.fish

function it_contains_system
  contains system (fry-ls)
end

function it_contains_rubies
  contains dummy-1 (fry-ls)
end

. $fish_tank
