function suite_fry-rubies
	function setup
		stub_var fry_rubies /tmp/rubies
		mkdir -p $fry_rubies/ruby-1.8/bin
		mkdir -p $fry_rubies/ruby-1.9/bin
		mkdir -p $fry_rubies/ruby-2.0/bin
		stub_var PATH $fry_rubies/ruby-1.9/bin $PATH
	end

	function test_exit_status
		assert (fry-rubies)
	end

	function test_output
		set -l normal (set_color normal)
		set -l green  (set_color green)

		assert_includes '  ruby-1.8'$normal (fry-rubies)
		assert_includes '* '$green'ruby-1.9'$normal (fry-rubies)
		assert_includes '  ruby-2.0'$normal (fry-rubies)
	end
end

if not set -q tank_running
	source (dirname (status -f))/helper.fish
	tank_run
end
