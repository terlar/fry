. helper.fish

function spec_ls_1 -d 'contains system'
  contains system (fry-ls)
end

function spec_ls_2 -d 'contains rubies'
  contains dummy-1 (fry-ls)
end

. tank/tank.fish (status -f)
