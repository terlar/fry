function fry-installer-ruby-install --description 'Installer for ruby-install'
	function __fry_install_ruby
		echo $argv | tr - ' ' | read -l implementation ver
		ruby-install $implementation $ver -r $fry_rubies
	end

	function __fry_install_rubies
		set -l implementation

		for line in (ruby-install | grep '  ')
			switch $line
			case '  *:'
				set implementation (echo $line | sed 's/[[:space:]]*\([[:alpha:]]*\):/\1/')

			case '    *:*'
				set -l ver (echo $line | sed 's/[[:space:]]*\(.*\):.*/\1/')
				echo $implementation-$ver
			end
		end
	end
end
