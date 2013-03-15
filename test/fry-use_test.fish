. helper.fish

context 'without <ruby>'; begin
  function subject
    fry-use
  end

  stub fry-rubies '::rubies::'

  it 'returns status 1'; begin
    subject >/dev/null
    if test $status -eq 1
      pass
    else
      fail
    end
  end

  it 'outputs rubies'; begin
    if contains '::rubies::' (subject)
      pass
    else
      fail
    end
  end
end

context 'with unknown <ruby>'; begin
  function subject
    fry-use unknown
  end

  stub fry-rubies '::rubies::'

  it 'returns status 1'; begin
    subject >/dev/null

    if test $status -eq 1
      pass
    else
      fail
    end
  end

  it 'outputs rubies'; begin
    if contains '::rubies::' (subject)
      pass
    else
      fail
    end
  end
end

context 'with known <ruby>'; begin
  function subject
    set PATH $fry_rubies/dummy-2/bin $PATH
    fry-use 'dummy-1'
  end

  it 'returns status 0'; begin
    subject >/dev/null

    if test $status -eq 0
      pass
    else
      fail
    end
  end

  it 'switches ruby'; begin
    subject >/dev/null

    if test $PATH[1] = $fry_rubies/dummy-1/bin
      pass
    else
      fail
    end
  end

  it 'resets ruby'; begin
    subject >/dev/null

    if not contains $fry_rubies/dummy-2/bin $PATH
      pass
    else
      fail
    end
  end

  it 'outputs switch text'; begin
    if contains "Switched to ruby 'dummy-1'" (subject)
      pass
    else
      fail
    end
  end
end

context 'with known and current <ruby>'; begin
  function subject
    set PATH $fry_rubies/dummy-1/bin $PATH
    fry-use 'dummy-1'
  end

  it 'returns status 0'; begin
    subject >/dev/null

    if test $status -eq 0
      pass
    else
      fail
    end
  end

  it 'outputs nothing'; begin
    if test -z (subject)
      pass
    else
      fail
    end
  end
end

context 'with system <ruby>'; begin
  function subject
    set PATH $fry_rubies/dummy-1/bin $PATH
    fry-use 'system'
  end

  it 'returns status 0'; begin
    subject >/dev/null

    if test $status -eq 0
      pass
    else
      fail
    end
  end

  it 'resets ruby'; begin
    subject >/dev/null

    if not contains $fry_rubies/dummy-1/bin $PATH
      pass
    else
      fail
    end
  end

  it 'outputs switch text'; begin
    if contains "Switched to system ruby" (subject)
      pass
    else
      fail
    end
  end
end

context 'with system and current <ruby>'; begin
  function subject
    fry-use 'system'
  end

  it 'returns status 0'; begin
    subject >/dev/null

    if test $status -eq 0
      pass
    else
      fail
    end
  end

  it 'outputs nothing'; begin
    if test -z (subject)
      pass
    else
      fail
    end
  end
end
