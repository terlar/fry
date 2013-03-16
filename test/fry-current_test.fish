. helper.fish

it 'outputs current ruby when found' (begin
  set -l clean_path $PATH
  set PATH $fry_rubies/dummy-1/bin $PATH

  assert_equals (fry-current) dummy-1

  set PATH $clean_path
end)

it 'outputs system ruby when not found' (begin
  assert_equals (fry-current) system
end)
