function suite_fry-install
	function setup
		function fry-installer-success-install
			function __fry_install_ruby
				echo install $argv
				return 0
			end

			function __fry_install_rubies
				echo ruby-1
				echo ruby-2
			end
		end

		function fry-installer-error-install
			function __fry_install_ruby
				return 1
			end

			function __fry_install_rubies
				echo ruby-1
				echo ruby-2
			end
		end

		stub_var fry_rubies (stub_dir)
		stub_var fry_installer success-install
	end

	function test_missing_build_command
		set fry_installer unknown-install

		refute (fry-install)
		assert_equal 'fatal: This feature requires an installer' (fry-install)
	end

	function test_argument_validation
		set -l output (fry-install)

		assert_equal 0 $status
		assert_includes 'usage: fry install <ruby>' $output
		assert_includes 'Available rubies:' $output
		assert_includes 'ruby-1' $output
		assert_includes 'ruby-2' $output
	end

	function test_failed_install
		set fry_installer error-install
		set -l output (fry-install unknown)

		assert_equal 1 $status
		assert_includes 'usage: fry install <ruby>' $output
		assert_includes 'Available rubies:' $output
		assert_includes 'ruby-1' $output
		assert_includes 'ruby-2' $output
	end

	function test_successful_install
		assert (fry-install ruby-2)
		assert_equal 'install ruby-2' (fry-install ruby-2)
	end
end

source (dirname (status -f))/helper.fish
