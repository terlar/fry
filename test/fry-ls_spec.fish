. helper.fish

function it_contains_system -d 'contains system'
  contains system (fry-ls)
end

function it_contains_rubies -d 'contains rubies'
  contains dummy-1 (fry-ls)
end

. $fish_tank
