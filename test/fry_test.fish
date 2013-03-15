. helper.fish

it 'returns status from command'; begin
  function fry-dummy
    return 1
  end

  fry dummy >/dev/null

  if test $status -eq 1
    pass
  else
    fail
  end
end

context 'without args'; begin
  function subject
    fry
  end

  it 'outputs rubies'; begin
    stub fry-rubies '::rubies::'

    if test (subject) = '::rubies::'
      pass
    else
      fail
    end
  end
end

context 'with unknown command'; begin
  function subject
    fry unknown
  end

  it 'outputs help'; begin
    stub fry-help '::help::'

    if test (subject) = '::help::'
      pass
    else
      fail
    end
  end
end

context 'with known command'; begin
  function subject
    fry version
  end

  it 'outputs command'; begin
    stub fry-version ::version::

    if test (subject) = '::version::'
      pass
    else
      fail
    end
  end
end

context 'with known ruby'; begin
  function subject
    fry dummy-1
  end

  it 'switches ruby'; begin
    stub fry-use ::use::

    if test (subject) = '::use::'
      pass
    else
      fail
    end
  end
end

