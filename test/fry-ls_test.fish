. helper.fish

function subject
  fry-ls
end

it 'contains system' (begin
  assert_contains system (fry-ls)
end)

it 'contains rubies' (begin
  assert_contains dummy-1 (fry-ls)
end)
