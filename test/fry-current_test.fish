. helper.fish

function subject
  fry-current
end

context 'when not found'; begin
  it 'outputs system ruby'; begin
    if test (subject) = 'system'
      pass
    else
      fail
    end
  end
end

context 'when found'; begin
  function subject
    set PATH $fry_rubies/dummy-1/bin $PATH
    fry-current
    set -e PATH[1]
  end

  it 'outputs current ruby'; begin
    if test (subject) = 'dummy-1'
      pass
    else
      fail
    end
  end
end
