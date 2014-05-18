function fry-installer-ruby-build --description 'Installer for ruby-build'
  function __fry_install_ruby
    ruby-build $argv $fry_rubies/$argv
  end

  function __fry_install_rubies
    ruby-build --definitions
  end
end
